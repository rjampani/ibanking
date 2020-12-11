#1/bin/bash

sudo systemctl status tomcat && {
        curl -sf http://localhost:8080/ibanking-1.0.0-SNAPSHOT && {
        echo -e "\033[1;32m Application is Up and Running...!\033[0m"
    } || {
        echo -e "\033[1;31m Application is not Up and Running, \033[0m"
        echo -e "\033[1;31m Please Verify the Server logs and troubleshoot.\033[0m"
    }
} || {
    echo -e "\033[1;31m Tomcat Server is not Up and Running..., \033[0m"
    echo -e "\033[1;31m Please Start/Restart Tomcat Web Server!\033[0m"
}