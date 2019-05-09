// Testing pipeline stuff.

pipeline {
    agent any

    stages {
        stage('Build') {
            when { branch 'master' }
            steps {
                sh 'touch make_env'
                sh 'make release'
            }
        }
        stage('Push to registry') {
            when { branch 'master' }
            steps { sh 'make push' }
        }
    }
    post {
        always {
            // Cleanup phase
            cleanWs()
            deleteDir()
            sh 'docker system prune -af'
            echo 'Cleaned up.'
        }
    }
}