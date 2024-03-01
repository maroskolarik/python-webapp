from flask import Flask

webapp = Flask(__name__)


@webapp.route('/')
def home():
    return "2024-03-01-0942"


if __name__ == '__main__':
    webapp.run(debug=True)
