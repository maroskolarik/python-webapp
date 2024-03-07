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
                    image "docker:25.0.3-dind"
                    args "-u root --privileged"
                }
            }
            steps {
                sh "sudo docker build -t maroskolarik/python-webapp-jenkins:0.0.${BUILD_NUMBER} ."
                sh "sudo docker build -t maroskolarik/python-webapp-jenkins:latest ."
            }
        }
    }
}
