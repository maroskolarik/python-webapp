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
