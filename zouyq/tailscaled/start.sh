#!/bin/sh

echo 'Starting up tailscale...'

echo 'net.ipv4.ip_forward = 1' | tee -a /etc/sysctl.conf
echo 'net.ipv6.conf.all.forwarding = 1' | tee -a /etc/sysctl.conf
sysctl -p /etc/sysctl.conf

tailscaled --verbose=1 --port 41641 &
sleep 5
if [ ! -S /var/run/tailscale/tailscaled.sock ]; then
    echo "tailscaled.sock does not exist. exit!"
    exit 1
fi

until tailscale up \
    --authkey=${TAILSCALE_AUTH_KEY} \
    --hostname=${HOSTNAME} \
    --advertise-exit-node
do
    sleep 0.1
done

echo 'Tailscale started. Lets go!

