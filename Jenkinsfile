pipeline {
    agent none

    tools{
        jdk 'myjava'
        maven 'maven'
    }
    stages {
        stage('Compile') {
            agent any
            steps {
                script{
                    echo "Compiling the code"
                    sh 'mvn compile'
                  }
            }
        }
        stage('UnitTest') { 
            agent any
            steps {
                script{
                    sshagent(['test_server']) {
                    echo "Running the test cases"
                    echo "line for pulling"
                    sh "scp -o StrictHostKeyChecking=no server-script.sh ec2-user@172.31.44.220:/home/ec2-user"
                    sh "ssh -o StrictHostKeyChecking=no ec2-user@172.31.44.220 'bash ~/server-script.sh'"
                    }
                }
            }
            post{
                always{
                    junit 'target/surefire-reports/*.xml'
                }
            }
        }
        stage('Package') {
            agent {label 'slave'}
            steps {
                script{
                    echo "Packaging the code "
                    sh 'mvn package'
                }
            }
        }
    }
    
}
