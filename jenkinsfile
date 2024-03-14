pipeline {
    agent any

    stages {
        stage('maven build ') {
            steps {
                sh "mvn clean package"
            }
        }
         stage(' dev deploy') {
            when {
                branch "develop"
            }
            steps {
                echo "Deploying the dev"
            }
        }
         stage(' test deploy') {
            when {
                branch "test"
            }
            steps {
                echo "test the dev"
            }
        }
         stage(' prod deploy') {
            when {
                branch "main"
            }
            steps {
                echo "production the dev"
            }
        }
    }
}
