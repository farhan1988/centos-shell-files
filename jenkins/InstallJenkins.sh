sudo yum install epel-release
sudo -E yum -y update 
sudo yum -y install wget

sudo yum -y install java-1.8.0-openjdk.x86_64
java -version
sudo cp /etc/profile /etc/profile_backup
echo 'export JAVA_HOME=/usr/lib/jvm/jre-1.8.0-openjdk' | sudo tee -a /etc/profile
echo 'export JRE_HOME=/usr/lib/jvm/jre' | sudo tee -a /etc/profile
source /etc/profile

sudo -E wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo
sudo -E rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key
sudo -E yum -y install jenkins
sudo chkconfig jenkins on
sudo service jenkins restart

systemctl enable firewalld
systemctl start firewalld
sudo -E firewall-cmd --zone=public --add-port=8080/tcp --permanent
sudo firewall-cmd --zone=public --add-service=http --permanent
sudo firewall-cmd --reload
sudo firewall-cmd --list-all

#sudo cat /var/lib/jenkins/secrets/initialAdminPassword