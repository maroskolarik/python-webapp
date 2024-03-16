pipeline {
    agent none
    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub-credentials')
        SERVER_CREDENTIALS = credentials('server-credentials')
    }
    stages {
        agent {
            docker { image 'python'}
        }
        stage("test") {
            steps {
                sh "pip install -r ./requirements.txt"
                sh "pytest"
            }
        }
        agent any
        stage("build") {
            steps {
                sh "docker build -t maroskolarik/python-webapp-jenkins:0.0.${BUILD_NUMBER} ."
                sh "docker build -t maroskolarik/python-webapp-jenkins:latest ."
            }
        }
        stage('login') {
            steps {
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            }
        }
        stage("push") {
            steps {
                sh "docker push maroskolarik/python-webapp-jenkins:0.0.${BUILD_NUMBER}"
                sh "docker push maroskolarik/python-webapp-jenkins:latest"
            }
        }
        stage('deploy') {
            steps {
                echo 'deploying'
            }
        }
    }
    post {
        always {
            sh 'docker logout'
        }
    }
}
