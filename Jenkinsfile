pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "shoe-website:latest"
    }

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/Ahammed-2006/cicd-pipeline-project.git'
            }
        }

        stage('Install Dependencies') {
            steps {
                sh 'npm install'
            }
        }

        stage('Lint / Code Check') {
            steps {
                sh 'npm run lint || true' // configure lint in package.json
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
