pipeline {
    agent none
    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub-credentials')
        SERVER_CREDENTIALS = credentials('server-credentials')
    }
    stages {
        stage("test") {
            agent {
                docker { image 'python'}
            }
            steps {
                sh "pip install -r ./requirements.txt"
                sh "pytest"
            }
        }
        stage("build") {
            agent any
            steps {
                sh "docker build -t maroskolarik/python-webapp-jenkins:0.0.${BUILD_NUMBER} ."
                sh "docker build -t maroskolarik/python-webapp-jenkins:latest ."
            }
        }
        stage('login') {
            agent any
            steps {
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            }
        }
        stage("push") {
            agent any
            steps {
                sh "docker push maroskolarik/python-webapp-jenkins:0.0.${BUILD_NUMBER}"
                sh "docker push maroskolarik/python-webapp-jenkins:latest"
            }
        }
        stage('deploy') {
            agent any
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
