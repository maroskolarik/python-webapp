pipeline {
        agent {
            docker {
                image 'python:3.12-slim'
                args '-u root --privileged'
            }
        }
    stages {
        stage('prepare env') {
            steps {
                echo 'preparing the environment...'
                sh '''
                python3 --version
                pip --version
                pip install -r requirements.txt
                '''
            }
        }
        stage('build') {
            steps {
                echo 'building the app...'
            }
        }
        stage('test') {
            steps {
                echo 'testing the app...'
            }
        }
    }
}
