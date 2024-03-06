pipeline {
        agent {
            docker { image 'python:3.12.2-slim-bookworm' }
        }
    stages {
        stage('build') {
            steps {
                echo 'building the app...'
                sh '''
                pip install -r ./requirements.txt
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
