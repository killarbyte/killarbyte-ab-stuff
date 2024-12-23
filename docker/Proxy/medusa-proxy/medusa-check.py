# -*- coding: utf-8 -*-

import requests
import subprocess
from itertools import product

def check_urls(urls, proxies):
    for url, proxy in product(urls, proxies):
        try:
            proxies = {
                'http': proxy,
                'https': proxy
            }
            response = requests.get(url, proxies=proxies, timeout=5)
            if response.status_code == 200:
                return True
        except:
            pass
    return False

def restart_docker_container(container_name):
    try:
        subprocess.run(["docker-compose", "restart", container_name], check=True)
        return True
    except:
        return False

# Список URL-ов для проверки
urls = [
    "http://ip-api.com/json",
    "http://eth0.me/"
]

# Список прокси SOCKS5 или HTTP без авторизации
proxies = [
    "http://127.0.0.1:8888",
    "http://127.0.0.1:8889",
    "http://127.0.0.1:8890",
    "http://127.0.0.1:8891"
    # Добавь еще прокси по аналогии, если нужно
]

# Имя контейнера в docker-compose для перезагрузки
container_name = "medusa-proxy"

bot_token = "YOUR_TOKEN"
chat_id = "YOUR_CHATID"
topic_id = "YOUR_TOPICID"
myserver_id = "YOUR_SERVERID"

error_check_urls = "Возникла ошибка при проверке ссылок через прокси."
error_restart_container = "Ошибка при перезагрузке контейнера."
info_restart_container = "Контейнер успешно перезагружен."

if not check_urls(urls, proxies):
    print(error_check_urls)
    url = f"https://api.telegram.org/bot{bot_token}/sendMessage?chat_id={chat_id}&reply_to_message_id={topic_id}&text={error_check_urls} {myserver_id}"
    requests.get(url)
    
    if restart_docker_container(container_name):
        print(info_restart_container)
        url = f"https://api.telegram.org/bot{bot_token}/sendMessage?chat_id={chat_id}&reply_to_message_id={topic_id}&text={info_restart_container} {myserver_id}"
        requests.get(url)
    else:
        print(error_restart_container)
        url = f"https://api.telegram.org/bot{bot_token}/sendMessage?chat_id={chat_id}&reply_to_message_id={topic_id}&text={error_restart_container} {myserver_id}"
        requests.get(url)
else:
    print("Все проверочные ссылки успешно открыты.")
