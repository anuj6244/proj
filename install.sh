#!/bin/bash

echo "Select the tools/software you want to install (space separated numbers):"
echo "1) Update Ubuntu"
echo "2) Install Java"
echo "3) Install Jenkins"
echo "4) Install Docker"
echo "5) Install Git"
echo "6) Install Ansible"
echo "7) Install Puppet"
echo "8) Install Chef"
echo "9) Install Terraform"
echo "10) Install Kubernetes (kubectl + minikube)"
echo "11) Install Helm"
echo "12) Install Prometheus + Grafana"
echo "13) Install ELK Stack"
echo "14) Install AWS CLI"
echo "15) Install Azure CLI"
echo "16) Install GCP SDK (gcloud)"
echo "17) Install MySQL"
echo "18) Install PostgreSQL"
echo "19) Install Redis"
echo "20) Install Nginx"
echo "21) Install Python"
echo "22) Install Node.js"
echo "23) Install Maven"
echo "24) Install Gradle"
echo "25) Install curl, wget, unzip, tar"
echo "26) Install htop, atop, glances"
echo "27) Install ufw and basic firewall rules"
echo "28) Install OpenSSL and Fail2Ban"

read -p "Enter your choices (e.g., 2 4 5): " -a choices

for choice in "${choices[@]}"; do

    case $choice in

        1)
            echo "Updating Ubuntu..."
            sudo apt update && sudo apt upgrade -y
            echo "Ubuntu updated."
            ;;

        2)
            read -p "Enter Java version (e.g., 17, 21): " version
            echo "Installing Java $version..."
            sudo apt install -y openjdk-"$version"-jdk
            java -version
            ;;

        3)
            read -p "Enter Jenkins version (e.g., 2.414.1): " version
            echo "Installing Jenkins $version..."
            sudo wget -O /etc/apt/keyrings/jenkins-keyring.asc \
			https://pkg.jenkins.io/debian-stable/jenkins.io-2026.key
			echo "deb [signed-by=/etc/apt/keyrings/jenkins-keyring.asc]" \
			https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
			/etc/apt/sources.list.d/jenkins.list > /dev/null
			sudo apt update
			sudo apt install jenkins
            jenkins --version
            ;;

        4)
            read -p "Enter Docker version (e.g., 24.0.5~3-0~ubuntu-jammy): " version
            echo "Installing Docker $version..."
            sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
            curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
            sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
            sudo apt update
            sudo apt install -y docker-ce="$version"
            docker --version
            ;;

        5)
            echo "Installing Git..."
            sudo apt install -y git
            git --version
            ;;

        6)
            echo "Installing Ansible..."
            sudo apt install -y ansible
            ansible --version
            ;;

        7)
            echo "Installing Puppet..."
            sudo apt install -y puppet
            puppet --version
            ;;

        8)
            echo "Installing Chef..."
            sudo apt install -y chef
            chef --version
            ;;

        9)
            echo "Installing Terraform..."
            sudo apt install -y terraform
            terraform -version
            ;;

        10)
            echo "Installing kubectl..."
            sudo apt install -y kubectl
            kubectl version --client
            echo "Installing minikube..."
            sudo apt install -y minikube
            minikube version
            ;;

        11)
            echo "Installing Helm..."
            sudo apt install -y helm
            helm version
            ;;

        12)
            echo "Installing Prometheus + Grafana..."
            sudo apt install -y prometheus grafana
            systemctl status prometheus
            systemctl status grafana-server
            ;;

        13)
            echo "Installing ELK Stack (Elasticsearch, Logstash, Kibana)..."
            sudo apt install -y elasticsearch logstash kibana
            systemctl status elasticsearch
            systemctl status kibana
            ;;

        14)
            echo "Installing AWS CLI..."
            sudo apt install -y awscli
            aws --version
            ;;

        15)
            echo "Installing Azure CLI..."
            sudo apt install -y azure-cli
            az --version
            ;;

        16)
            echo "Installing GCP SDK..."
            sudo apt install -y google-cloud-sdk
            gcloud --version
            ;;

        17)
            echo "Installing MySQL..."
            sudo apt install -y mysql-server
            mysql --version
            ;;

        18)
            echo "Installing PostgreSQL..."
            sudo apt install -y postgresql postgresql-contrib
            psql --version
            ;;

        19)
            echo "Installing Redis..."
            sudo apt install -y redis-server
            redis-server --version
            ;;

        20)
            echo "Installing Nginx..."
            sudo apt install -y nginx
            nginx -v
            ;;

        21)
            echo "Installing Python..."
            sudo apt install -y python3 python3-pip
            python3 --version
            pip3 --version
            ;;

        22)
            echo "Installing Node.js..."
            sudo apt install -y nodejs npm
            node -v
            npm -v
            ;;

        23)
            echo "Installing Maven..."
            sudo apt install -y maven
            mvn -v
            ;;

        24)
            echo "Installing Gradle..."
            sudo apt install -y gradle
            gradle -v
            ;;

        25)
            echo "Installing curl, wget, unzip, tar..."
            sudo apt install -y curl wget unzip tar
            ;;

        26)
            echo "Installing htop, atop, glances..."
            sudo apt install -y htop atop glances
            ;;

        27)
            echo "Installing UFW and setting basic firewall rules..."
            sudo apt install -y ufw
            sudo ufw enable
            sudo ufw allow ssh
            sudo ufw status
            ;;

        28)
            echo "Installing OpenSSL and Fail2Ban..."
            sudo apt install -y openssl fail2ban
            ;;

        *)
            echo "Invalid option: $choice"
            ;;
    esac

done

echo "All selected installations are complete."