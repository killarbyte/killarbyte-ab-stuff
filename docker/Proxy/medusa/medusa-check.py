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
    "http://google.com"
]

# Список прокси SOCKS5 или HTTP без авторизации
proxies = [
    "socks5://proxy1_ip:proxy1_port",
    "socks5://proxy2_ip:proxy2_port",
    # Добавь еще прокси по аналогии, если нужно
]

# Имя контейнера в docker-compose для перезагрузки
container_name = "medusa-proxy"

if not check_urls(urls, proxies):
    print("Не удалось открыть несколько проверочных ссылок через несколько прокси, перезагрузка контейнера...")
    if restart_docker_container(container_name):
        print("Контейнер успешно перезагружен.")
    else:
        print("Ошибка при перезагрузке контейнера.")
else:
    print("Все проверочные ссылки успешно открыты.")
