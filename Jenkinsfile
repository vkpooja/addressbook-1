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
                    echo "Running the test cases"
                    sh 'mvn test'
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
