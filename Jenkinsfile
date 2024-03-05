pipeline {
        agent {
            docker { image 'python:3.12-slim-bookworm' }
        }
    stages {
        stage('build') {
            steps {
                echo 'building the app...'
                sh '''
                pip install -r requirements.txt
                '''
            }
        }
        stage('test') {
            steps {
                echo 'testing the app...'
                sh '''
                cd src
                python3 test_webapp.py
                '''
            }
        }
    }
}
