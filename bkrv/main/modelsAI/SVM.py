import pandas as pd
from sklearn import svm
from .TfidfProcess import TfidfProcess
from .ModelController import ModelController


def create_model():
    
    data = pd.read_csv('main/data/spam_or_not_spam.csv')
    # remove empty line
    data.dropna(inplace=True, how='any')

    # learn the vocabulary from data and save preprocessor
    text_processor = TfidfProcess()
    text_data = text_processor.fit_vectorize(data['email'])
    ModelController.save_preprocessor(text_processor)

    # train and save SVM model
    model = svm.SVC(gamma='scale')
    model.fit(text_data, data['label'])
    ModelController.save_model(model, 'SVM')
