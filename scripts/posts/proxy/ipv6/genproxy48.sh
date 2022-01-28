#!/bin/bash

### main settings ###
ipv4='hostname --ip-address'
portproxy=20000
user=login
pass=passw
config="/etc/3proxy/conf/3proxy.cfg"

### clean cfg ###
echo -ne > /etc/3proxy/conf/3proxy.cfg
echo -ne > /app/proxy/ipv6-socks5-proxy/proxylist.txt
echo -ne > /app/proxy/ipv6-socks5-proxy/proxylist_key_collector.txt
echo -ne > /app/proxy/ipv6-socks5-proxy/xproxy.txt
echo -ne > /app/proxy/ipv6-socks5-proxy/xevil.txt

### cfg start ###
echo "daemon" >> $config
echo "maxconn 3000" >> $config
echo "nserver [2606:4700:4700::1111]" >> $config
echo "nserver [2606:4700:4700::1001]" >> $config
echo "nserver [2001:4860:4860::8888]" >> $config
echo "nserver [2001:4860:4860::8844]" >> $config
echo "nserver [2a02:6b8::feed:0ff]" >> $config
echo "nserver [2a02:6b8:0:1::feed:0ff]" >> $config
echo "nscache 65536" >> $config
echo "nscache6 65536" >> $config
echo "timeouts 1 5 30 60 180 1800 15 60" >> $config
#echo "setgid 65535" >> $config
#echo "setuid 65535" >> $config
#echo "monitor $config" >> $config
echo "flush" >> $config
echo "auth strong" >> $config
echo  "users $user:CL:$pass" >> $config
echo "allow $user" >> $config

for i in `cat ip.list`; do
    echo "proxy -6 -s0 -n -a -olSO_REUSEADDR,SO_REUSEPORT -ocTCP_TIMESTAMPS,TCP_NODELAY -osTCP_NODELAY,SO_KEEPALIVE -p$portproxy -i$ipv4 -e$i" >> $config
    ((inc+=1))
    ((portproxy+=1))
  ### other software proxylist creation ###
	echo "$ipv4:$portproxy:$user:$pass" >> proxylist.txt
	echo "$ipv4:$portproxy@$user:$pass;v6" >> proxylist_key_collector.txt
	echo "$user:$pass@$ipv4:$portproxy" >> xproxy.txt
	echo "http://$ipv4:$portproxy:$user:$pass" >> xevil.txt
done