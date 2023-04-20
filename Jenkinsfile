/* Requires the Docker Pipeline plugin */
pipeline {
    agent { docker { image 'ubuntu:latest' } }
    stages {
        stage('install docker') {
            steps {
                sh 'apt update'
                sh 'apt install docker.io'
            }
        }
        stage('build') {
            steps {
                sh 'docker build -t jenkins-test-express .'
            }
        }
        stage('deploy') {
            steps {
                sh 'docker stop jenkins-test-express || true'
                sh 'docker rm jenkins-test-express || true'
                sh 'docker run -d --name jenkins-test-express -p 3000:3000 jenkins-test-express'
            }
        }
    }
}

