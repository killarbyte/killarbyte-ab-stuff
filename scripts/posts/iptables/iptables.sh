#!/bin/bash

# https://www.digitalocean.com/community/tutorials/iptables-essentials-common-firewall-rules-and-commands
# https://www.youtube.com/watch?v=D7LgjSOWCxg
# https://www.youtube.com/watch?v=qruazgOjMMY

# Смотрим правила по умолчинию
# sudo iptables -nvL
# sudo iptables -L -n --line-numbers

# Мониторинг iptables покажет активные в данный момент правила (обязательно 5 пробелов между нулями)
# watch -n 1 'sudo iptables -nvL | grep -v "0     0"'

# Проверка правила iptables.
# Проверяем открытость / закрытость портов:
# netstat -tulpn
# Проверяем открытость / закрытость определенного порта:
# netstat -tulpn | grep :80

# Чистим все цепочки
sudo iptables -F
sudo iptables -X
sudo iptables -t nat -F
sudo iptables -t nat -X
sudo iptables -t mangle -F
sudo iptables -t mangle -X
sudo iptables -P INPUT ACCEPT
sudo iptables -P OUTPUT ACCEPT
sudo iptables -P FORWARD ACCEPT


# Разрешаем ВХОДЯЩИЙ траффик для интерфейса lo
sudo iptables -A INPUT -i lo -j ACCEPT
# Разрешаем ИСХОДЯЩИЙ траффик для интерфейса lo
sudo iptables -A OUTPUT -o lo -j ACCEPT


# Разрешаем ВХОДЯЩИЙ траффик который инициирован самим сервером. т.е. для уже установленных соединений
sudo iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
# Разрешаем ИСХОДЯЩИЙ трафик для всех установленных соединений, которые обычно являются ответом на законные входящие соединения.
sudo iptables -A OUTPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT

# Запрещяем ВХОДЯЩИЕ невалидные пакеты
sudo iptables -A INPUT -m conntrack --ctstate INVALID -j DROP


############
### ICMP ###
############

# Разрешаем ВХОДЯЩИЙ ICMP трафик
sudo iptables -A INPUT -p icmp -j ACCEPT
# Разрешаем ИСХОДЯЩИЙ ICMP трафик
sudo iptables -A OUTPUT -p icmp -j ACCEPT


############
### DHCP ###
############

# Allow outbound DHCP request
# sudo iptables -A OUTPUT -o eth0 -p udp --dport 67:68 --sport 67:68 -j ACCEPT


###########
### DNS ###
###########

# Разрешаем ВХОДЯЩИЙ DNS трафик. В случае если у нас есть DNS сервер. (не проверял)
# sudo iptables -A INPUT -p udp -m udp --dport 53 -j ACCEPT
# sudo iptables -A INPUT -p udp -m udp --sport 53 --dport 1024:65535 -j ACCEPT
# Разрешаем ИСХОДЯЩИЙ DNS трафик. Чтобы можно было пинговать и т.д. другие сайты
sudo iptables -A OUTPUT -p udp -m udp --dport 53 -j ACCEPT


###########
### SSH ###
###########

# Разрешаем ВХОДЯЩИЕ подключения на порт SSH(22) для одного ip адреса /32 либо для подсети напр /16
sudo iptables -A INPUT -p tcp -s xxx.xxx.xxx.xxx/16 --dport 22 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
# Разрешаем ИСХОДЯЩИЕ подключения на порт SSH(22) для одного ip адреса /32 либо для подсети напр /16
sudo iptables -A OUTPUT -p tcp --sport 22 -m conntrack --ctstate ESTABLISHED -j ACCEPT


####################
### HTTP / HTTPS ###
####################

# Разрешаем ВХОДЯЩИЙ траффик на порты 80 и 443
sudo iptables -A INPUT -p tcp -m multiport --dports 80,443 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
# Разрешаем ИСХОДЯЩИЙ траффик на порты 80 и 443
sudo iptables -A OUTPUT -p tcp -m multiport --dports 80,443 -m conntrack --ctstate ESTABLISHED -j ACCEPT


#########################
### HTTP / HTTPS MISC ###
#########################

# # Установить количество запросов HTTP до 3
# sudo iptables -A INPUT -p tcp --syn --dport 80 -m connlimit --connlimit-above 3 -j DROP
# # connlimit-above 3 : Указывает, что правило действует только если количество соединений превышает 3.
# # connlimit-mask 24 : Указывает маску сети.


# Запрещаем ВХОДЯЩИЙ траффик на 80 порт, если в первой тысяче байт пакета есть упоминание о боте
# sudo iptables -I INPUT -p tcp --dport 80 -m string --algo bm --string "archive.org" --to 1000 -j DROP
# sudo iptables -I INPUT -p tcp --dport 80 -m string --algo bm --string "BLEXBot" --to 1000 -j DROP
# sudo iptables -I INPUT -p tcp --dport 80 -m string --algo bm --string "coccocbot" --to 1000 -j DROP
# sudo iptables -I INPUT -p tcp --dport 80 -m string --algo bm --string "DomainSONOCrawler" --to 1000 -j DROP
# sudo iptables -I INPUT -p tcp --dport 80 -m string --algo bm --string "LinkpadBot" --to 1000 -j DROP
# sudo iptables -I INPUT -p tcp --dport 80 -m string --algo bm --string "ltx71.com" --to 1000 -j DROP
# sudo iptables -I INPUT -p tcp --dport 80 -m string --algo bm --string "MJ12bot" --to 1000 -j DROP
# sudo iptables -I INPUT -p tcp --dport 80 -m string --algo bm --string "Pandalytics" --to 1000 -j DROP
# sudo iptables -I INPUT -p tcp --dport 80 -m string --algo bm --string "Researchscan" --to 1000 -j DROP
# sudo iptables -I INPUT -p tcp --dport 80 -m string --algo bm --string "SemrushBot" --to 1000 -j DROP
# sudo iptables -I INPUT -p tcp --dport 80 -m string --algo bm --string "Slurp" --to 1000 -j DROP
# sudo iptables -I INPUT -p tcp --dport 80 -m string --algo bm --string "uCrawler" --to 1000 -j DROP


# # Запрещаем ВХОДЯЩИЙ траффик на 80 и 443 порт, если в первой тысяче байт пакета есть упоминание о боте [https не проверял!]
# sudo iptables -I INPUT -p tcp -m multiport --dports 80,443 -m string --algo bm --string "archive.org" --to 1000 -j DROP
# sudo iptables -I INPUT -p tcp -m multiport --dports 80,443 -m string --algo bm --string "BLEXBot" --to 1000 -j DROP
# sudo iptables -I INPUT -p tcp -m multiport --dports 80,443 -m string --algo bm --string "coccocbot" --to 1000 -j DROP
# sudo iptables -I INPUT -p tcp -m multiport --dports 80,443 -m string --algo bm --string "DomainSONOCrawler" --to 1000 -j DROP
# sudo iptables -I INPUT -p tcp -m multiport --dports 80,443 -m string --algo bm --string "LinkpadBot" --to 1000 -j DROP
# sudo iptables -I INPUT -p tcp -m multiport --dports 80,443 -m string --algo bm --string "ltx71.com" --to 1000 -j DROP
# sudo iptables -I INPUT -p tcp -m multiport --dports 80,443 -m string --algo bm --string "MJ12bot" --to 1000 -j DROP
# sudo iptables -I INPUT -p tcp -m multiport --dports 80,443 -m string --algo bm --string "Pandalytics" --to 1000 -j DROP
# sudo iptables -I INPUT -p tcp -m multiport --dports 80,443 -m string --algo bm --string "Researchscan" --to 1000 -j DROP
# sudo iptables -I INPUT -p tcp -m multiport --dports 80,443 -m string --algo bm --string "SemrushBot" --to 1000 -j DROP
# sudo iptables -I INPUT -p tcp -m multiport --dports 80,443 -m string --algo bm --string "Slurp" --to 1000 -j DROP
# sudo iptables -I INPUT -p tcp -m multiport --dports 80,443 -m string --algo bm --string "uCrawler" --to 1000 -j DROP


#################
### 3proxy v6 ###
#################

# Разрешаем ВХОДЯЩИЙ траффик для одного ip/32 либо для подсети /24 /16 и.т.д
sudo iptables -A INPUT -i eth0 -s xxx.xxx.xxx.xxx/32 -m multiport -p tcp --dports 41001:41500 -j ACCEPT
# Разрешаем ИСХОДЯЩИЙ траффик для одного ip/32 либо для подсети /24 /16 и.т.д
# sudo iptables -A OUTPUT -s xxx.xxx.xxx.xxx/32 -m multiport -p tcp --dports 41001:41500 -j ACCEPT


###########
### SQL ###
###########

# # Разрешаем ВХОДЯЩИЙ траффик MySQL
# sudo iptables -A INPUT -p tcp -s xxx.xxx.xxx.0/24 --dport 3306 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
# # Разрешаем ИСХОДЯЩИЙ траффик MySQL
# sudo iptables -A OUTPUT -p tcp --sport 3306 -m conntrack --ctstate ESTABLISHED -j ACCEPT


# # Разрешаем ВХОДЯЩИЙ траффик PostgreSQL
# sudo iptables -A INPUT -p tcp -s xxx.xxx.xxx.0/24 --dport 5432 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
# # Разрешаем ИСХОДЯЩИЙ траффик PostgreSQL
# sudo iptables -A OUTPUT -p tcp --sport 5432 -m conntrack --ctstate ESTABLISHED -j ACCEPT


###########
### NTP ###
###########

# Разрешаем Network Time Protocol наружу
sudo iptables -A OUTPUT -o eth0 -p udp --dport 123 --sport 123 -j ACCEPT


############
### MAIL ###
############

# # Разрешаем ВХОДЯЩИЙ траффик SMTP
# sudo iptables -A INPUT -p tcp --dport 25 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
# # Разрешаем ИСХОДЯЩИЙ траффик SMTP
# sudo iptables -A OUTPUT -p tcp --sport 25 -m conntrack --ctstate ESTABLISHED -j ACCEPT


# # Разрешаем ВХОДЯЩИЙ траффик IMAP
# sudo iptables -A INPUT -p tcp --dport 143 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
# # Разрешаем ИСХОДЯЩИЙ траффик IMAP
# sudo iptables -A OUTPUT -p tcp --sport 143 -m conntrack --ctstate ESTABLISHED -j ACCEPT


# # Разрешаем ВХОДЯЩИЙ траффик IMAPS
# sudo iptables -A INPUT -p tcp --dport 993 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
# # Разрешаем ИСХОДЯЩИЙ траффик IMAPS
# sudo iptables -A OUTPUT -p tcp --sport 993 -m conntrack --ctstate ESTABLISHED -j ACCEPT


# # Разрешаем ВХОДЯЩИЙ траффик POP3
# sudo iptables -A INPUT -p tcp --dport 110 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
# # Разрешаем ИСХОДЯЩИЙ траффик POP3
# sudo iptables -A OUTPUT -p tcp --sport 110 -m conntrack --ctstate ESTABLISHED -j ACCEPT


# # Разрешаем ВХОДЯЩИЙ траффик POP3S
# sudo iptables -A INPUT -p tcp --dport 995 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
# # Разрешаем ИСХОДЯЩИЙ траффик POP3S
# sudo iptables -A OUTPUT -p tcp --sport 995 -m conntrack --ctstate ESTABLISHED -j ACCEPT


############
### Misc ###
############

# # Разрешаем ВХОДЯЩИЙ траффик Rsync
# sudo iptables -A INPUT -p tcp -s xxx.xxx.xxx.0/24 --dport 873 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
# # Разрешаем ИСХОДЯЩИЙ траффик Rsync
# sudo iptables -A OUTPUT -p tcp --sport 873 -m conntrack --ctstate ESTABLISHED -j ACCEPT


##############
### DOCKER ###
##############

# Используем мост Ethernet, созданный docker и названный docker0, чтобы установить правила для пересылки
sudo iptables -A INPUT -i docker0 -j ACCEPT
sudo iptables -A OUTPUT -o docker0 -j ACCEPT

# Добавляем правило для nginx
sudo iptables -A INPUT -p tcp -m tcp --dport 39080 -j ACCEPT

# Добавляем правило для NPM(Nginx Proxy Manager)
sudo iptables -A INPUT -p tcp -m tcp --dport 43013 -j ACCEPT

# Добавляем правило для mariadb
#sudo iptables -A INPUT -p tcp -m tcp --dport 10000 -j ACCEPT

##############
### POLICY ###
##############

# Чтобы сбрасывать весь трафик:
sudo iptables -P INPUT DROP
sudo iptables -P OUTPUT ACCEPT
sudo iptables -P FORWARD ACCEPT
