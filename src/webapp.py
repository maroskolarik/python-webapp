from flask import Flask

webapp = Flask(__name__)


@webapp.route('/')
def home():
    return "Welcome to webapp!"


if __name__ == '__main__':
    webapp.run(debug=True)
