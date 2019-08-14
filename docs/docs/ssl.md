# Obtain SSL Certificates

Because we have a qualified domain name hooked up to our server, we'll be able to obtain an SSL certificate. I followed [this presentation](https://www.slideshare.net/willingc/jupyterhub-tutorial-at-jupytercon) to install **certbot**, a program used to generate SSL certificates. 

[TOC]

## Install and run certbot

We'll use certbot to obtain a standalone SSL certificate. 

But wait- we need to make sure that port 80 is open on the ufw firewall. If port 80 is closed, cirtbot won't be able to verify that our domain name is correctly configured. So before running cirtbot, make sure to open port 80.

```text
$ sudo ufw allow 80
$ sudo ufw status
```

Now use the commands below to install certbot, modify permissions, and run certbot to obtain an SSL certificate. Make sure to replace ```mydomain.org``` with your domain name.

```text.
$ cd ~
$ mkdir certbot
$ cd certbot
$ wget https://dl.eff.org/certbot-auto
$ chmod a+x certbot-auto
$ ./certbot-auto certonly --standalone -d mydomain.org
```

If certbot worked, and we get our SSL certificate- the output looks something like below:

```text
IMPORTANT NOTES:
 - Congratulations! Your certificate and chain have been saved at:
   /etc/letsencrypt/live/mydomain.org/fullchain.pem
   Your key file has been saved at:
   /etc/letsencrypt/live/mydomain.org/privkey.pem
   Your cert will expire on 2018-08-15. 
```

## File Locations

Note the location of the ```fullchain.pem``` and ```privkey.pem``` files. We'll need to put these file paths into the Nginx configuration.

We also need to allow Nginx to access these files. I had trouble getting Nginx to run and [this presentation](https://www.youtube.com/watch?v=alaGteCPZU8&t=1721s) showed a way to give Nginx access to the SSL key files. There is probably a more "Linuxy" way of giving Nginx access to the cert files, but I messed around with the permission settings for a while, and using the commands below worked.

```text
$ cd /etc/letsencrypt
$ ls
accounts  archive  csr  keys  live  renewal  renewal-hooks
$ sudo chmod 777 -R archive/
$ sudo chmod 777 -R live/
$ ls -la
```

## Next Steps

The next step is to create a cookie secret, proxy auth token, and dhparem.pem file.

<br>
