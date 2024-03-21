pipeline {
    agent any


    stages {
        
        stage('Build Docker Image') {
            steps {
                script {
                    // Build Docker image
                    docker.build("my-docker-image:${env.BUILD_NUMBER}")
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    // Push Docker image to Docker registry (if needed)
                    docker.withRegistry('https://registry.example.com', 'credentials-id') {
                        docker.image("my-docker-image:${env.BUILD_NUMBER}").push()
                    }
                }
            }
        }

        stage('Deploy Docker Container') {
            steps {
                script {
                    // SSH into Docker host and run Docker commands
                    sshagent(['ssh-credentials-id']) {
                        sh 'ssh user@docker-host "docker pull my-docker-image:${env.BUILD_NUMBER}"'
                        sh 'ssh user@docker-host "docker stop my-container || true && docker rm my-container || true"'
                        sh 'ssh user@docker-host "docker run -d --name my-container -p 8080:8080 my-docker-image:${env.BUILD_NUMBER}"'
                    }
                }
            }
        }
    }
}
