pipeline {
        agent none
    stages {
        stage("test") {
            agent {
                docker {
                    image "python:3.12-slim"
                    args "-u root --privileged"
                }
            }
            steps {
                sh "pip install -r ./requirements.txt"
                sh "python3 ./src/test_webapp.py"
            }
        }
        stage("build") {
            agent {
                docker {
                    image "debian"
                    args '-u root --privileged'
                }
            }
            steps {
                sh "whoami"
                sh 'apt update && apt install curl -y'
                sh 'curl -fsSL https://get.docker.com | sh'
                sh "docker -v"
                sh "docker run hello-world"
                sh "docker build -t maroskolarik/python-webapp-jenkins:0.0.${BUILD_NUMBER} ."
//                 sh "docker build -t maroskolarik/python-webapp-jenkins:latest ."
            }
        }
    }
}
