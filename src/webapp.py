from flask import Flask

webapp = Flask(__name__)


@webapp.route('/')
def home():
    return "2024-03-02-0824"


if __name__ == '__main__':
    webapp.run(debug=True)
