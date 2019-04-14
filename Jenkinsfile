pipeline {
    agent any

    stages {
        stage('Build') {
                steps {
                    echo 'Checking Out Code..'
                    checkout scm
                }
            }
        stage('Build') {
            steps {
                echo 'Building..'
                sh 'build.sh'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}