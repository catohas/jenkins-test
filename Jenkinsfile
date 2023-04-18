/* Requires the Docker Pipeline plugin */
pipeline {
    agent {
        dockerfile {
            filename 'Dockerfile'
            dir '.'
            label 'jenkins-express-test'
        }
    }
    stages {
        stage('deploy') {
            steps {
                sh 'docker stop jenkins-test-express || true'
                sh 'docker rm jenkins-test-express || true'
                sh 'docker run -d --name jenkins-test-express -p 3000:3000 jenkins-test-express'
            }
        }
    }
}

