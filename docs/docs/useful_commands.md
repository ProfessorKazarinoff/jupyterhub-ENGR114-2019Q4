# Usefull Commands

Below are some useful commands for setting up and running JupyterHub 

### kill configurable-http-proxy

```text
ps aux | grep configurable-http-proxy
kill ####                
```

### nginx

```text
sudo service nginx stop
sudo service nginx start
sudo service nginx restart
nginx -t
```

### Shutdown and restart server

```text
sudo shutdown -r now
```

### Start JupyterHub with sudo (need to do this to allow other users to logon)

```text
sudo /home/peter/anaconda3/bin/jupyterhub
```

### Start jupyterhub as service, will run continuously

```text
sudo systemctl start jupyterhub
sudo systemctl <start|stop|status> jupyterhub
```

### Add environmental variables:

```text
$ export OAUTH_CLIENT_SECRET=xxxxxxxxxxx
```

### Gitpuller extension URLs

```text
https://domain.org/hub/user-redirect/git-pull?repo=GitHubUserName%2FRepoName&branch=master&app=lab
```

### Change the systemctl start jupyterhub configurations

If changes are made to ```/etc/systemd/system/jupyterhub.service```, need to reload:

```text
sudo systemctl daemon-reload
sudo systemctl start jupyterhub
```

Similar to the above but with a couple changes. Assuming you're using ```/opt/anaconda3/jupyterhub``` for your configs, save this as ```/etc/systemd/system/jupyterhub.service```

```text
[Unit]
Description=Jupyterhub
After=syslog.target network.target

[Service]
User=root
Environment="PATH=/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/opt/anaconda3/bin"
ExecStart=/opt/anaconda3/bin/jupyterhub -f /etc/jupyterhub/jupyterhub_config.py

[Install]
WantedBy=multi-user.target
```

<br>
