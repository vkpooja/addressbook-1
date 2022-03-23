pipeline {
    agent none

    tools{
        jdk 'myjava'
        maven 'maven'
    }
    environment{
        test_server_IP='ec2-user@172.31.44.220'
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
                    sh "scp -o StrictHostKeyChecking=no server-script.sh ${test_server_IP}:/home/ec2-user"
                    sh "ssh -o StrictHostKeyChecking=no ${test_server_IP} 'bash ~/server-script.sh'"
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
