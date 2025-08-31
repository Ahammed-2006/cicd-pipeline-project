pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "shoe-website:latest"
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/Ahammed-2006/cicd-pipeline-project.git'
            }
        }

        stage('Build & Test with Maven') {
            steps {
                sh "mvn clean test"
            }
        }

        stage('Docker Build') {
            steps {
                sh "docker build -t ${DOCKER_IMAGE} ."
            }
        }

        stage('Deploy Locally') {
            steps {
                sh '''
                docker stop shoe-website || true
                docker rm shoe-website || true
                docker run -d --name shoe-website -p 8080:80 ${DOCKER_IMAGE}
                '''
            }
        }
    }
}
