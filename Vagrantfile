Vagrant.configure("2") do |config| 
    config.vm.define "db-server" do |db| 
        db.vm.box = "ubuntu/bionic64"
        db.vm.hostname = "db-server"
        db.vm.synced_folder ".", "/vagrant"
        db.vm.network "private_network", ip: "192.168.84.2", 
        virtualbox__intnet: "ibanking"

        db.vm.provision "copy-ibanking-schema", type: "file", 
        source: "src/main/db/ibanking-schema.sql", 
        destination: "$HOME/"
        db.vm.provision "copy-mysql-secure", type: "file", 
        source: "src/main/scripts/mysql-secure.sh", 
        destination: "$HOME/"

        db.vm.provision "mysql-install", type: "shell" do |sh| 
            sh.path = "src/main/scripts/mysql-install.sh"
        end

        db.vm.provision "create-schema", type: "shell" do |sh| 
            sh.path = "src/main/scripts/create-schema.sh"
        end

        db.vm.provision "clean", type: "shell" do |sh| 
            sh.path = "src/main/scripts/clean.sh"
        end

        db.vm.provider "virtualbox" do |vbox| 
            vbox.name = db.vm.hostname
            vbox.cpus = 1
            vbox.memory = 1024
        end
    end

    config.vm.define "web-server" do |web| 
        web.vm.box = "ubuntu/bionic64"
        web.vm.hostname = "web-server"
        web.vm.synced_folder ".", "/vagrant"

        web.vm.network "forwarded_port", guest: "8080", host:"8088", host_ip: "127.0.0.1"
        
        web.vm.network "private_network", ip: "192.168.84.3", virtualbox__intnet: "ibanking"
    
        web.vm.provision "openjdk-8-jre-installation", type: "shell" do |sh| 
            sh.path = "src/main/scripts/openjdk-8-jre-installation.sh"
        end

        web.vm.provision "upload-tomcat-service", type: "file", 
        source: "src/main/scripts/tomcat.service", 
        destination: "$HOME/"

        web.vm.provision "tomcat9-download-extract-configure", type: "shell" do |sh| 
            sh.path = "src/main/scripts/tomcat-9-installation.sh"
        end

        web.vm.provision "deploy-application", type: "shell" do |sh| 
            sh.path = "src/main/scripts/deploy-application.sh"
        end

        web.vm.provision "appl-health-check", type: "shell" do |sh| 
            sh.path = "src/main/scripts/appl-health-check.sh"
        end

        web.vm.provider "virtualbox" do |vbox| 
            vbox.name = web.vm.hostname
            vbox.cpus = 1
            vbox.memory = 2048
        end
    end
end