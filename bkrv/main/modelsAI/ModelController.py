import pickle


class ModelController:

    @staticmethod
    def save_model(model, name):
        filename = 'main/modelsAI/SVM.model'
        pickle.dump(model, open(filename, 'wb+'))

    @staticmethod
    def load_model():
        filename = 'main/modelsAI/SVM.model'
        model = pickle.load(open(filename, 'rb'))
        return model

    @staticmethod
    def save_preprocessor(processor):
        filename = 'main/modelsAI/TfIdf.proc'
        pickle.dump(processor, open(filename, 'wb+'))

    @staticmethod
    def load_preprocessor():
        filename = 'main/modelsAI/TfIdf.proc'
        preprocessor = pickle.load(open(filename, 'rb'))
        return preprocessor


if __name__ == '__main__':
    ModelController().load_preprocessor()