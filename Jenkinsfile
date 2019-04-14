pipeline {
    agent any

    stages {
        stage('Code Checkout') {
                steps {
                    echo 'Checking Out Code..'
                    checkout scm
                }
            }
        stage('Build') {
            steps {
                echo 'Building..'
                pwd
                ls -l
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