pipeline {
    agent none

    tools{
        jdk 'myjava'
        maven 'maven'
    }
    environment{
        BUILD_SERVER_IP='ec2-user@172.31.44.220'
        IMAGE='vkpooja/myrepo:$BUILD_NUMBER'
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
        stage('PACKAGE+BUILD THE DOCKERFILE AND PUSH TO DOKCER HUB') {
            agent any
            steps {
                script{
                    sshagent(['BUILD_SERVER_KEY']) {
                    withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'password', usernameVariable: 'username')]) {
                    echo "Running the test cases"
                    sh "scp -o StrictHostKeyChecking=no server-script.sh ${BUILD_SERVER_IP}:/home/ec2-user"
                    sh "ssh -o StrictHostKeyChecking=no ${BUILD_SERVER_IP} 'bash ~/server-script.sh'"
                    sh "ssh ${BUILD_SERVER_IP} sudo docker build -t ${IMAGE} /home/ec2-user/addressbook-1"
                    sh "ssh ${BUILD_SERVER_IP} sudo docker login -u $username -p $password"
                    sh "ssh ${BUILD_SERVER_IP} sudo docker push ${IMAGE}"
                    echo "deploy the app"
                    sh "ssh ${BUILD_SERVER_IP} sudo docker run -itd -P ${IMAGE}"
                    echo "Packaging the code "
                    }}
                }
            }
        }
        
    }
    
}
