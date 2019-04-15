pipeline {
    agent any

    stages {
        stage('Info') {
                    steps {
                        echo "Running ${env.BUILD_ID} on ${env.JENKINS_URL}"
                    }
                }
        stage('Code Checkout') {
                steps {
                    echo 'Checking Out Code..'
                    checkout scm
                }
            }
        stage('Build') {
            steps {
                echo 'Building..'
                sh './build.sh'
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