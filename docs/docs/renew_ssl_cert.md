# Renew SSL Certificate

After about two months, the SSL certificate we obtained with certbot in a [previous step](ssl.md) needs to be updated. The SSL cert will need to be renewed with certbot so that we can continue running HTTPS on our JupyterHub server.

[TOC]

## Why Does the SSL Cirt Expire?

When we used certbot to obtain an SSL certificut, the certificate we aquired was only applicable for 90 days. I recieved an email reminding me that the SSL cert needed to be updated:

```text
Hello,

Your certificate (or certificates) for the names listed below will expire in 10 days (on 12 Nov 19 04:23 +0000).
Please make sure to renew your certificate before then, or visitors to your website will encounter errors.

We recommend renewing certificates automatically when they have a third of their
total lifetime left. For Let's Encrypt's current 90-day certificates, that means
renewing 30 days before expiration. See
https://letsencrypt.org/docs/integration-guide/ for details.
```

## Updating the SSL cirt

To update the SSL cert, we need to run ```certbot-auto renew``` in the correct directory. 

Previously, we installed certbot into ```/home/peter/cirtbot``` on our JupyterHub server. To renew the certificate, log into the server and navigate to the directory where certbot is installed.

```text
$ cd cirtbot
$ pwd
/home/peter/cirtbot
$ ./certbot-auto renew
...
Congratulations, all renewals succeeded...
```

If this command doesn't work, there may be a problem if port 80 is closed by the ufw firewall. Open port 80 in ufw with the command below:

```text
$ sudo ufw allow 80
```

If the ```./certbot-auto renew``` command still doesn't work, try shutting down JupyterHub and Nginx. Log into JupyterHub as an admin user and shut down any running servers first.

```text
$ sudo systemclt stop jupyterhub
$ sudo systemctl stop nginx
$ pwd
/home/peter/cirtbot
$ ./certbot-auto renew
```

If JupyterHub and Nginx are both shut down, they both need to restarted after the SSL cert is renewed.

```text
$ sudo systemctl start nginx
$ sudo systemctl start jupyterhub
```

Also, if port 80 was opened, close port 80 after the cert is renewed. The only ports/apps that need to be allowed by the ufw firewall are Nginx and OpenSSH. All other ports like 80 and 8000 can be closed in ufw.

!!! important
    Only open ports and apps in the ufw firewall that are needed to run JupyterHub and Nginx. Close all other ports in ufw.

```text
$ sudo ufw deny 80
```

Then log back into JupyterHub as a user. Make sure everything still works as before. 

## Summary

After completing these steps, we have a new SSL cert that is valid for 90 days. The SSL can be renewed using the same steps outlined above when it needs to be renewed again.

<br>
