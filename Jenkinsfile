pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/balaji-stack/march2025.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t my-nginx-app .'
                }
            }
        }

        stage('Run Container') {
            steps {
                script {
                    sh 'docker run -d -p 8080:80 --name my-nginx-container my-nginx-app'
                }
            }
        }
    }
}

