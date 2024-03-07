pipeline {
        agent none
    stages {
        stage('test') {
            agent {
                docker {
                    image 'python:3.12-slim'
                    args '-u root --privileged'
                }
            }
            steps {
                sh 'pip install -r ./requirements.txt'
                sh 'python3 ./src/test_webapp.py'
            }
        }
    }
}
