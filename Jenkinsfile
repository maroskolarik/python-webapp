pipeline {
        agent {
            docker { image 'python:3.12.2-slim-bookworm' }
        }
    stages {
        stage('build') {
            steps {
                echo 'building the app...'
                sh '''
                whoami
//                 su root
//                 pip install virtualenv
//                 virtualenv venv
//                 source venv/bin/activate
//                 pip install -r ./requirements.txt
                '''
            }
        }
        stage('test') {
            steps {
                echo 'testing the app...'
                sh '''
                python3 ./src/test_webapp.py
                '''
            }
        }
    }
}
