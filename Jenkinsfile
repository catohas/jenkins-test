pipeline {
    agent { 
        docker { 
            image 'node:16.17.1-alpine' 
            args '-u root' 
        } 
    }
    stages {
        stage('Install openrc') {
            steps {
                sh 'apk add --no-cache openrc'
            }
        }
        stage('Install and start Docker') {
            steps {
                sh 'apk add --no-cache docker'
            }
        }
        stage('Build') {
            steps {
                sh 'docker build -t jenkins-test-express .'
            }
        }
        stage('Deploy') {
            steps {
                sh 'docker stop jenkins-test-express || true'
                sh 'docker rm jenkins-test-express || true'
                sh 'docker run -d --name jenkins-test-express -p 3000:3000 jenkins-test-express'
            }
        }
    }
}

