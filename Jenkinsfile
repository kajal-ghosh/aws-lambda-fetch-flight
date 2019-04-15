pipeline {
    agent any
    environment {
            ARTIFACTORY_API_ACCESS_KEY = credentials('Artifactory_Key')
     }

    stages {
        stage('Info') {
                    steps {
                        echo "Running ${env.BUILD_ID} on ${env.JENKINS_URL}"
                        echo "Artifactory URL: ${env.ARTIFACTORY_URL}"
                        echo "Artifactory API Access Key: ${env.ARTIFACTORY_API_ACCESS_KEY}"
                    }
                }
        stage('Build') {
            steps {
                echo 'Building..'
                sh "./build.sh"
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
            }
        }
        stage('Upload to Artifactory') {
            steps {
                echo 'Upload to Artifactory....'
                sh "./build.sh deploy-artifactory ${env.ARTIFACTORY_URL} ${ARTIFACTORY_API_ACCESS_KEY} gradle-dev"
            }
        }
    }
}