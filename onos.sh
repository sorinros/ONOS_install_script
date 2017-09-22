#######################
## ONOS Installation ##
#######################

# Dependent package
sudo apt-get update
sudo apt-get git

# Install Java 8
sudo apt-get install software-properties-common -y
sudo add-apt-repository ppa:webupd8team/java -y
sudo apt-get update
echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" | sudo debconf-set-selections
sudo apt-get install oracle-java8-installer oracle-java8-set-default -y

# Install Maven
mkdir -p ~/Downloads ~/Applications
cd ~/Downloads && wget http://archive.apache.org/dist/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz
tar -zxvf apache-maven-3.3.9-bin.tar.gz -C ../Applications/

# Clone ONOS
cd ~/ && git clone https://github.com/opennetworkinglab/onos.git

# Set environment Variable
# Add following lines to ~/.bashrc
export JAVA_HOME=/usr/lib/jvm/java-8-oracle
export ONOS_ROOT=~/onos
source $ONOS_ROOT/tools/dev/bash_profile

# Load the environment variable
source ~/.bashrc

# Build ONOS
cd ~/onos && onos-buck build onos

#####################
## Install Mininet ##
#####################

# sudo apt-get install mininet
cd ~/ && git clone https://github.com/mininet/mininet
cd mininet/ && util/install.sh -a

######################
## Development Tool ##
######################
cd ~/ && wget https://download.jetbrains.com/idea/ideaIC-2017.2.4.tar.gz
