sudo yum -y install wget
sudo -E wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo
sudo -E rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key
sudo -E yum -y update 
sudo -E yum -y install java-1.7.0-openjdk
java -version
sudo -E yum -y install jenkins
sudo chkconfig jenkins on
sudo service jenkins restart
systemctl enable firewalld
systemctl start firewalld
sudo -E firewall-cmd --zone=public --add-port=8080/tcp --permanent
sudo firewall-cmd --zone=public --add-service=http --permanent
sudo firewall-cmd --reload
sudo firewall-cmd --list-all
sudo cat /var/lib/jenkins/secrets/initialAdminPassword