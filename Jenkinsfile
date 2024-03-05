pipeline {
        agent {
            docker { image 'sabbir1cse/ubuntu-python-pip-supervisor' }
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
