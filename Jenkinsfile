pipeline {
        agent {
            docker {
                image 'debian:stable-slim'
            }
        }
    stages {
        stage('prepare env') {
            steps {
                echo 'preparing the environment...'
                sh '''
                apt install python3
                apt install pip
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
