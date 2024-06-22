pipeline {
    agent any

    environment {
        registryCredential = 'docker' // Replace with your Docker registry credentials ID
        dockerImage = 'amazonlinux'       // Replace with your Docker image name
        dockerTag = 'latest'                         // Replace with your desired Docker image tag
        dockerfilePath = './Dockerfile'              // Path to your Dockerfile
    }

    stages {
        stage('Build and Push Docker Image') {
            steps {
                // Pull Dockerfile from Git repository (if not present locally)
                script {
                    if (!fileExists("${dockerfilePath}")) {
                        def gitCloneCmd = "git clone https://github.com/Sada-Siva-Reddy07/docker-jenkins.git ."
                        sh script: gitCloneCmd, returnStatus: true
                    }
                }

                // Build Docker image
                script {
                    def dockerImageTag = "${dockerImage}:${dockerTag}"
                    docker.build(dockerImageTag, "-f ${dockerfilePath} .")
                }

                // Push Docker image to Docker registry
                script {
                    def dockerImageTag = "${dockerImage}:${dockerTag}"
                    docker.withRegistry('', registryCredential) {
                        dockerImage.push()
                    }
                }
            }
        }
    }

    post {
        success {
            echo 'Pipeline succeeded!'
        }
        failure {
            echo 'Pipeline failed :('
        }
    }
}
