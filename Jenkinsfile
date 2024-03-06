pipeline {
        agent {
            docker { image 'sabbir1cse/ubuntu-python-pip-supervisor' }
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
