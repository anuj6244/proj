pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "anuj6244/devops-demo"
    }

    tools {
        maven 'Maven'
        jdk 'JDK17'
    }

    stages {

     stage('Checkout') {
    steps {
        git(
            url: 'https://github.com/anuj6244/proj.git',
            branch: 'main'
        )
    }
}

        stage('Build') {
            steps {
                sh 'mvn clean package'
            }
        }

        stage('Test') {
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
                sh 'docker build -t $DOCKER_IMAGE:latest .'
            }
        }

        stage('Push to DockerHub') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'dockerhub-creds',
                    usernameVariable: 'USER',
                    passwordVariable: 'PASS')]) {

                    sh '''
                    docker login -u $USER -p $PASS
                    docker push $DOCKER_IMAGE:latest
                    '''
                }
            }
        }

        stage('Deploy to Runtime VM') {
            steps {
                sh '''
                ssh azureuser@RUNTIME_VM_IP                 "docker pull $DOCKER_IMAGE:latest &&
                 docker stop demo || true &&
                 docker rm demo || true &&
                 docker run -d -p 8080:8080 --name demo $DOCKER_IMAGE:latest"
                '''
            }
        }
    }
}
