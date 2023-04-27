/* Requires the Docker Pipeline plugin */
pipeline {
    agent {
        docker {
            image 'docker'
            args '-v /var/run/docker.sock:/var/run/docker.sock --user root'
            reuseNode true
        } 
    }
    stages {
        stage('stop') {
            steps {
                sh 'docker stop jenkins-test-express || true'
                sh 'docker rm jenkins-test-express || true'
            }
        }
        stage('delete') {
            steps {
                sh 'docker rmi -f jenkins-test-express || true'
            }
        }
        stage('build') {
            steps {
                sh 'docker build -t jenkins-test-express .'
            }
        }
        stage('deploy') {
            steps {
                sh 'docker run --restart=unless-stopped -d --name jenkins-test-express -p 3001:3001 jenkins-test-express'
            }
        }
    }
}
