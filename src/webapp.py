from flask import Flask

webapp = Flask(__name__)


@webapp.route('/')
def home():
    return "Wednesday..."


if __name__ == '__main__':
    webapp.run(debug=True)
