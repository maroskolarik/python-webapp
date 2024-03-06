pipeline {
        agent {
            docker {
                image 'python'
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
