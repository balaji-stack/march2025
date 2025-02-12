pipeline {
    agent any

    environment {
        IMAGE_NAME = "balaji004/app"  // Your Docker Hub username
        REGISTRY_CREDENTIALS = "docker-hub-credentials"
    }

    stages {
        stage('Clone Repository') {
            steps {
                withCredentials([string(credentialsId: 'github-token', variable: 'GITHUB_TOKEN')]) {
                    sh '''
                        if [ -d "march2025" ]; then
                            rm -rf march2025
                        fi
                        git clone -b main https://$GITHUB_TOKEN@github.com/balaji-stack/march2025.git
                    '''
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker --version' // Verify Docker is installed
                dir('march2025') {  // Navigate into repo directory
                    script {
                        docker.build("${IMAGE_NAME}:latest")
                    }
                }
            }
        }

        stage('Push to Docker Hub') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'docker-hub-credentials', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    sh 'echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin'
                }
                script {
                    docker.image("${IMAGE_NAME}:latest").push()
                }
            }
        }

        stage('Deploy to Production') {
            steps {
                sh '''
                    docker stop my-app || true
                    docker rm my-app || true
                    docker pull balaji004/app:latest
                    docker run -d --name my-app -p 80:80 balaji004/app:latest
                '''
            }
        }
    }
}
