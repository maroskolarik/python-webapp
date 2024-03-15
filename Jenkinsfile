pipeline {
        agent any
    stages {
        stage("test") {
            steps {
                sh "pip install -r ./requirements.txt"
                sh "python3 ./src/test_webapp.py"
            }
        }
        stage("build") {
            steps {
                sh "docker build -t maroskolarik/python-webapp-jenkins:0.0.${BUILD_NUMBER} ."
                sh "docker build -t maroskolarik/python-webapp-jenkins:latest ."
            }
        }
        stage("build") {
            steps {
                sh "docker push maroskolarik/python-webapp-jenkins:0.0.${BUILD_NUMBER}"
                sh "docker push maroskolarik/python-webapp-jenkins:latest"
            }
        }
    }
}
