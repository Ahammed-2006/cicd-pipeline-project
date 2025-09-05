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

        stage('Install Dependencies') {
            steps {
                sh '''
                if [ -f package.json ]; then
                    echo "Installing Node.js dependencies..."
                    npm install
                else
                    echo "hello everyone, skipping dependency installation."
                fi
                '''
            }
        }

        stage('Lint / Code Check') {
            steps {
                sh '''
                if [ -f package.json ]; then
                    echo "Running npm lint..."
                    npm run lint || true
                else
                    echo "No lint configured, skipping."
                fi
                '''
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
                docker run -d --name shoe-website -p 9090:80 ${DOCKER_IMAGE}
                '''
            }
        }
    }
}
