sudo yum install java-1.8.0-openjdk-devel -y
sudo yum install git -y
sudo yum install maven -y

git clone https://github.com/vkpooja/addressbook-1.git
cd /home/ec2-user/addressbook-1
mvn test