pipeline {
    agent any

    environment {
        IMAGE_NAME = "yourdockerhub/devops-demo"
        IMAGE_TAG = "${BUILD_NUMBER}"
    }

    tools {
        maven 'Maven'
        jdk 'JDK17'
    }

    stages {

        stage('Checkout') {
            steps {
                git 'https://github.com/anuj6244/proj.git'
            }
        }

        stage('Build') {
            steps {
                sh 'mvn clean package'
            }
        }

        stage('Run Tests') {
            steps {
                sh 'mvn test'
            }
        }

        stage('Upload to Nexus') {
            steps {
                sh 'mvn deploy'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $IMAGE_NAME:$IMAGE_TAG .'
            }
        }

        stage('Push Docker Image') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'dockerhub-creds',
                    usernameVariable: 'USER',
                    passwordVariable: 'PASS')]) {

                    sh '''
                    docker login -u $USER -p $PASS
                    docker push $IMAGE_NAME:$IMAGE_TAG
                    '''
                }
            }
        }

        stage('Deploy to Runtime VM') {
            steps {
                sh """
                ssh azureuser@RUNTIME_VM_IP '
                docker pull $IMAGE_NAME:$IMAGE_TAG
                docker stop demo || true
                docker rm demo || true
                docker run -d -p 8080:8080 --name demo $IMAGE_NAME:$IMAGE_TAG
                '
                """
            }
        }
    }
}
