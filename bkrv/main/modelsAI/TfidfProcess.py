from sklearn.feature_extraction.text import TfidfVectorizer
from nltk import pos_tag
from nltk.stem import WordNetLemmatizer
from nltk.tokenize import word_tokenize
from nltk.corpus import stopwords
import re


class TfidfProcess:

    def __init__(self):

        self.stop_words = set(stopwords.words('english'))
        self.lemmatizer = WordNetLemmatizer()
        self.vectorizer = TfidfVectorizer(lowercase=False, min_df=0.01, preprocessor=self.preprocess)

    def preprocess(self, content):

        # transform to lower case
        content.lower()
        # tokenize
        content = word_tokenize(content)
        # filter out stopwords
        content = [w for w in content if w not in self.stop_words]
        # create a tag map
        tag_map = dict()
        tag_map['N'] = 'n'  # noun
        tag_map['J'] = 'a'  # adj
        tag_map['V'] = 'v'  # verb
        tag_map['R'] = 'r'  # adv

        for i in range(len(content)):
            word = content[i]
            # transform all urls to 'URL'
            if re.search('http', word) is not None:
                word = 'URL'
            # transform all numbers to 'NUMBER'
            if re.search(r'\d', word) is not None:
                word = 'NUMBER'
            # transform all symbols to 'SYMBOL'
            if re.search('[^A-Za-z]+', word) is not None:
                word = 'SYMBOL'
            # lemmatize
            tag = pos_tag([word])[0][1]
            try:
                content[i] = self.lemmatizer.lemmatize(word, tag_map[tag[0]])
            except KeyError:
                content[i] = self.lemmatizer.lemmatize(word)

        # join all tokens back into text
        content = ' '.join(content)
        return content

    def fit_vectorize(self, train_data):

        return self.vectorizer.fit_transform(train_data)

    def transform_vectorize(self, data):

        return self.vectorizer.transform(data)


if __name__ == '__main__':
    text = input("Enter: ")
    print(TfidfProcess().preprocess(text))



