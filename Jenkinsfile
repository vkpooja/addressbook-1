pipeline {
    agent none

    tools{
        jdk 'myjava'
        maven 'maven'
    }
    environment{
        DEPLOY_SERVER_IP='ec2-user@3.108.185.155'
    }
    stages {
        stage('DEPLOY THE APP FROM DOCKERHUB IMAGE') {
            agent any
            steps {
                script{
                    sshagent(['deploy-server']) {
                    withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'password', usernameVariable: 'username')]) {
                    echo "deploy the image"
                    sh "ssh -o StrictHostKeyChecking=no ${DEPLOY_SERVER_IP} sudo yum install docker -y"
                    sh "ssh ${DEPLOY_SERVER_IP} sudo systemctl start docker"
                    sh "ssh ${DEPLOY_SERVER_IP} sudo docker login -u $username -p $password"
                    sh "ssh ${DEPLOY_SERVER_IP} sudo docker run -itd -P vkpooja/myrepo:39"
                    echo "Packaging the code "
                    }}
                }
            }
        }
    }
    
}
