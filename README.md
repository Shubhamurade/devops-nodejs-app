# 🚀 DevOps Node.js CI/CD Pipeline using Jenkins & Docker

This project demonstrates an end-to-end DevOps pipeline for a Node.js application using GitHub, Jenkins, Docker, and AWS EC2.

The goal of this project is to:
- Build a Node.js application
- Create a Docker image
- Automate build and run using Jenkins
- Deploy and run the application on an EC2 instance

---

## 🛠️ Tech Stack

- Node.js
- Docker
- Jenkins
- Git & GitHub
- AWS EC2 (Amazon Linux)
- Linux

---

## 📂 Project Structure

devops-nodejs-app/

├── Jenkinsfile  
├── Dockerfile  
├── package.json  
├── package-lock.json  
├── app.js  
├── README.md  
└── jenkins-docker/  

---

## ⚙️ Prerequisites

### Local Machine
- Git installed
- Docker Desktop installed
- GitHub account

### AWS
- EC2 instance (Amazon Linux)
- Port 3000 open in Security Group
- SSH key (.pem file)

---

## 🚀 Deployment Steps (Start to End)

### 1️⃣ Clone the Repository

git clone https://github.com/<your-username>/devops-nodejs-app.git  
cd devops-nodejs-app  

---

### 2️⃣ Test Node.js App Locally (Optional)

npm install  
node app.js  

Open in browser:  
http://localhost:3000

---

### 3️⃣ Build Docker Image Locally

docker build -t devops-nodejs-app:latest .  

Run the container:  

docker run -d -p 3000:3000 devops-nodejs-app:latest  

---

### 4️⃣ Jenkins Setup Using Docker

docker run -d \
--name jenkins \
-p 8080:8080 \
-p 50000:50000 \
-v jenkins_home:/var/jenkins_home \
-v /var/run/docker.sock:/var/run/docker.sock \
jenkins/jenkins:lts  

Access Jenkins:  
http://localhost:8080  

Install Jenkins Plugins:
- Git
- Pipeline
- Docker Pipeline
- SSH Agent

---

### 5️⃣ Jenkins Pipeline Flow

The Jenkinsfile performs:
1. Git checkout
2. Docker image build
3. Run container test
4. (Optional) Deploy to EC2 using SSH

---

### 6️⃣ EC2 Instance Setup

SSH into EC2:

ssh -i your-key.pem ec2-user@<EC2_PUBLIC_IP>  

Install Docker:

sudo yum install docker -y  
sudo systemctl start docker  
sudo usermod -aG docker ec2-user  

Logout and login again.

---

### 7️⃣ Deploy Application on EC2

Build Docker image:

docker build -t devops-nodejs-app:latest .  

Run container:

docker run -d -p 3000:3000 devops-nodejs-app:latest  

Access the app:

http://<EC2_PUBLIC_IP>:3000  

---

## ✅ Final Result

- Node.js app running inside Docker
- Jenkins CI/CD pipeline working
- Application accessible via browser
- Fully reproducible deployment

---

## 🧹 Cleanup (When Pausing the Project)

### Local Machine

docker system prune -a  

### EC2 Instance

docker stop $(docker ps -q)  
docker rm $(docker ps -aq)  
docker system prune -a  

---

## 📌 Future Enhancements

- Push Docker image to Docker Hub
- Add GitHub Webhooks
- Use Jenkins credentials securely
- Add Nginx reverse proxy
- Deploy using AWS ECS or EKS

---

## 👨‍💻 Author

Shubham Urade  
DevOps | Cloud | Linux | Docker | Jenkins
