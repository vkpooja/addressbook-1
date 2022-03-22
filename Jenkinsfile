pipeline {
    agent any

    tools{
        jdk 'myjava'
        maven 'maven'
    }
    stages {
        stage('Compile') {
            steps {
                script{
                    echo "Compiling the code"
                    sh 'mvn compile'
                  }
            }
        }
        stage('UnitTest') { 
            
            steps {
                script{
                    echo "Running the test cases"
                    sh 'mvn test'
                }
            }
        }
        stage('Package') {
            steps {
                script{
                    echo "Packaging the code"
                    sh 'mvn package'
                }
            }
        }
    }
    
}
