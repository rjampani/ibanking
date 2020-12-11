mysql -uroot -proot < ibanking-schema.sql && {
    echo -e "\033[1;32m ibanking schema created successfully..\033[0m"
} || {
    echo -e "\033[1;31m ibanking schema creation failed, Please troubleshoot\033[0m"
    exit 1
}
