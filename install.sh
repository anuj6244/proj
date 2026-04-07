



#!/bin/bash

echo "Please select an option to install:"
echo "1) Update Ubuntu"
echo "2) Install Java 17"
echo "3) Install Jenkins"
echo "4) Install Docker"
read -p "Enter your choice (1-4): " choice

update_ubuntu() {
    echo "Updating Ubuntu..."
    sudo apt update && sudo apt upgrade -y
    echo "Ubuntu update complete."
}

install_java() {
    if java -version &> /dev/null; then
        echo "Java is already installed:"
        java -version
    else
        echo "Installing Java 17..."
        sudo apt update
        sudo apt install -y openjdk-17-jdk
        echo "Java 17 installation complete."
    fi
}

install_jenkins() {
    if command -v jenkins &> /dev/null; then
        echo "Jenkins is already installed:"
        jenkins --version
    else
        echo "Installing Jenkins..."
        sudo wget -O /etc/apt/keyrings/jenkins-keyring.asc \
			https://pkg.jenkins.io/debian-stable/jenkins.io-2026.key
		echo "deb [signed-by=/etc/apt/keyrings/jenkins-keyring.asc]" \
			https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
			/etc/apt/sources.list.d/jenkins.list > /dev/null
		sudo apt update
		sudo apt install jenkins
    fi
}

install_docker() {
    if command -v docker &> /dev/null; then
        echo "Docker is already installed:"
        docker --version
    else
        echo "Installing Docker..."
        sudo apt update
        sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
        curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
        sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
        sudo apt update
        sudo apt install -y docker-ce
        echo "Docker installation complete."
    fi
}

case $choice in
    1)
        update_ubuntu
        ;;
    2)
        install_java
        ;;
    3)
        install_jenkins
        ;;
    4)
        install_docker
        ;;
    *)
        echo "Invalid option. Please run the script again and choose a valid option (1-4)."
        ;;
esac