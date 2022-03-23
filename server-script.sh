sudo yum install java-1.8.0-openjdk-devel -y
sudo yum install git -y
sudo yum install maven -y
if [ -d "addressbook-1" ]
then 
 echo "repository is already present"
 cd /home/ec2-user/addressbook-1
 git pull origin b1
else
 echo "cloning the repository"
 git clone https://github.com/vkpooja/addressbook-1.git
 cd /home/ec2-user/addressbook-1
fi
mvn test