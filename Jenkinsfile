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
        stage('build') {
            steps {
                sh 'docker rmi -f jenkins-test-express || true'
                sh 'docker build -t jenkins-test-express .'
            }
        }
        stage('deploy') {
            steps {
                sh 'docker stop jenkins-test-express || true'
                sh 'docker rm jenkins-test-express || true'
                sh 'docker run --restart=on-failure -d --name jenkins-test-express -p 3000:3000 jenkins-test-express'
            }
        }
    }
}
