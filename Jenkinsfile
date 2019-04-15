pipeline {
    agent any

    stages {
        stage('Info') {
                    steps {
                        echo "Running ${env.BUILD_ID} on ${env.JENKINS_URL}"
                        echo "Artifactory URL: ${env.ARTIFACTORY_URL}"
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
                sh "./build.sh deploy-artifactory ${env.ARTIFACTORY_URL}"
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