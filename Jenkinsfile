pipeline {
        agent {
            docker { image 'debian:stable-slim' }
        }
    stages {
        stage('prepare env') {
            steps {
                echo 'preparing the environment...'
                sh '''
                apt update
                apt install python3 -y
                apt install python3-pip -y
                '''
            }
        }
        stage('build') {
            steps {
                echo 'building the app...'
                sh '''
                pip install virtualenv
                virtualenv venv
                source venv/bin/activate
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
