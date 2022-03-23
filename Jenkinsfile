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
                    sh "ssh ec2-user@172.31.44.220 'mvn test'"
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
                    echo "Packaging the code"
                    sh 'mvn package'
                }
            }
        }
    }
    
}
