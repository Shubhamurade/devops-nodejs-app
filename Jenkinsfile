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

        stage('Deploy to EC2') {
            steps {
                sh '''
                ssh -o StrictHostKeyChecking=no \
                    -i /var/jenkins_home/ec2-key.pem \
                    ec2-user@3.7.68.247 "
                        docker stop nodejs-app || true
                        docker rm nodejs-app || true
                        docker run -d \
                          --name nodejs-app \
                          -p 3000:3000 \
                          devops-nodejs-app:latest
                    "
                '''
            }
        }
    }
}
