pipeline {
    agent any

    environment {
        // Define your Docker registry credentials if needed
        registryCredential = 'docker' // Example credential ID
        dockerImage = 'your-docker-image-name'      // Docker image name
        dockerTag = 'v1.0'                          // Tag for the Docker image
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout source code from Git repository
                git 'https://github.com/Sada-Siva-Reddy07/docker-jenkins.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                // Build Docker image
                script {
                    def dockerImageTag = "${dockerImage}:${dockerTag}"
                    docker.build(dockerImageTag, '.')
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                // Push Docker image to Docker registry
                script {
                    def dockerImageTag = "${dockerImage}:${dockerTag}"
                    docker.withRegistry('', registryCredential) {
                        dockerImage.push()
                    }
                }
            }
        }

        stage('Deploy') {
            // Add deployment steps here if needed
            steps {
                echo 'Deploying...'
                // Example deployment step: deploy to Kubernetes
                // kubernetesDeploy(configs: 'your-kubernetes-config.yml', kubeconfigId: 'your-kubeconfig', enableConfigSubstitution: true)
            }
        }
    }

    post {
        success {
            echo 'Pipeline succeeded!'

            // Optionally, you can trigger downstream jobs or notifications here
        }

        failure {
            echo 'Pipeline failed :('

            // Optionally, you can trigger notifications or perform cleanup actions here
        }
    }
}
