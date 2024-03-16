pipeline {
    agent none
    environment {
        DOCKERHUB_CREDS = credentials('dockerhub-creds')
        DEPLOYMENT_SERVER_CREDS = credentials('deployment-server-creds')
    }
    stages {
        stage("test") {
            agent {
                docker {
                    image 'python'
                    args '--privileged -u root'
                }
            }
            steps {
                sh "pip install -r ./requirements.txt"
                sh "pytest"
            }
        }
        stage("build") {
            agent {
                docker { image 'python'}
            }
            steps {
                sh "docker build -t maroskolarik/python-webapp-jenkins:0.0.${BUILD_NUMBER} ."
                sh "docker build -t maroskolarik/python-webapp-jenkins:latest ."
            }
        }
        stage('login') {
            agent {
                docker { image 'python'}
            }
            steps {
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            }
        }
        stage("push") {
            agent {
                docker { image 'python'}
            }
            steps {
                sh "docker push maroskolarik/python-webapp-jenkins:0.0.${BUILD_NUMBER}"
                sh "docker push maroskolarik/python-webapp-jenkins:latest"
            }
        }
        stage('deploy') {
            agent {
                docker { image 'python'}
            }
            steps {
                echo 'deploying'
            }
        }
    }
//     post {
//         always {
//             sh 'docker logout'
//         }
//     }
}
