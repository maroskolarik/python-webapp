from flask import Flask

webapp = Flask(__name__)


@webapp.route('/')
def home():
    return "2024-02-27-1143"


if __name__ == '__main__':
    webapp.run(debug=True)
