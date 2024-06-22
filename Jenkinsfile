pipeline {
    agent any

    environment {
        DOCKER_CREDENTIALS_ID = 'docker'
        DOCKER_IMAGE = 'your-docker-image-name'
        DOCKER_REGISTRY = 'https://index.docker.io/v1/'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        
        stage('Build Docker Image') {
            steps {
                script {
                    dockerImage = docker.build("${DOCKER_IMAGE}:${env.BUILD_ID}")
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    docker.withRegistry(DOCKER_REGISTRY, DOCKER_CREDENTIALS_ID) {
                        dockerImage.push()
                    }
                }
            }
        }
        
        stage('Deploy') {
            steps {
                echo "Deploying the application..."
                // Add deployment steps here
            }
        }
    }

    post {
        always {
            cleanWs()
        }
    }
}
