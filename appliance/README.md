**EXPERIMENTAL** docker containter to run rsyslog

This aims at providing a full-functional docker container with ample features.
Right now, it is under development. We welcome checking out and commenting it,
but **do not use it in production**.

This provides two containers:
- alpine based, this is what you want in production
- ubuntu based, this is primarily for rsyslog developers

more info:
- https://github.com/rsyslog/rsyslog/issues/2368
- https://github.com/rsyslog/rsyslog/projects/5

## Deployment example for Kubernetes:
To run your rsyslog-container in production under Kubernetes, you can start with this template
- ../rsyslog-deployment.yaml

### Kubernetes infos for high load traffic
If you have much traffic from the same source-ip, you have to tune your Loadbalancer-settings.
I case of a ipvs-implementation in Kubernetes:
```
ipvsadm -Ln --timeout
### e.g.: Timeout (tcp tcpfin udp): 900 120 300
###        => if you would like Load-Distribution for the same Source-IP => set UDP-Timeout to 1:
ipvsadm --set 900 120 1
```

To make this settings permanent, you can do it e.g. in this way:
```
cat <<EOF > /etc/systemd/system/ipvs-config.service
[Unit]
Description=Configure IPVS
After=network.target

[Service]
Type=oneshot
ExecStart=/sbin/ipvsadm --set 900 120 1
RemainAfterExit=false
StandardOutput=journal

[Install]
WantedBy=multi-user.target
EOF


systemctl daemon-reload
systemctl enable ipvs-config
systemctl start ipvs-config
```

## projects that provide docker containers:

- https://github.com/deoren/rsyslog-docker (based on @halfer provided files)
- https://github.com/megastef/rsyslog-logsene (logsene-enabled)
- https://github.com/camptocamp/docker-rsyslog-bin/blob/master/Dockerfile (Ubunut xenial)
- https://github.com/jumanjihouse/docker-rsyslog (Alpine Linux)
