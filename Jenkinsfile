pipeline {
    agent any

    stages {
        stage('Checkout Code') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t devops-nodejs-app:latest .'
            }
        }

        stage('Run Container Test') {
            steps {
                sh 'docker run -d -p 3001:3000 devops-nodejs-app:latest'
            }
        }
    }
}
