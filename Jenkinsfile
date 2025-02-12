pipeline {
    agent any

    environment {
        IMAGE_NAME = "your-dockerhub-username/app"
        REGISTRY_CREDENTIALS = "docker-hub-credentials"
    }

    stages {
        stage('Clone Repository') {
            steps {
                withCredentials([string(credentialsId: 'github-token', variable: 'GITHUB_TOKEN')]) {
                    sh 'git clone https://github.com/balaji-stack/march2025.git'
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("${IMAGE_NAME}:latest")
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
    }
}

