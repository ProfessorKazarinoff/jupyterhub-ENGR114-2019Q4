# jupyterhub-ENGR114-2019Q4

This repo contains the shared files used to create a JupyterHub server on Digital Ocean using an Nginx proxy server and SSL security. This deployment is for an Engineering Programming class (ENGR114) at Portland Community College during Fall 2019.

## Deployment Docs

Docs for this deployment of JupyterHub in Fall 2019 can be found here:

 > [https://professorkazarinoff.github.io/jupyterhub-ENGR114-2019Q4/](https://professorkazarinoff.github.io/jupyterhub-ENGR114-2019Q4)

The next most recent deployment of JupyterHub in ENGR101 Winter 2019 can be found here:

 > [https://professorkazarinoff.github.io/jupyterhub-engr101/](https://professorkazarinoff.github.io/jupyterhub-engr101/)

Docs for a very similar deployment of JupyterHub in ENGR114 Winter 2019 can be found here:

 > [https://professorkazarinoff.github.io/jupyterhub-engr114/](https://professorkazarinoff.github.io/jupyterhub-engr114/)

For another deployment of JupyterHub on Digital Ocean with Nginx proxy. See these blog posts:

> [https://pythonforundergradengineers.com/why-jupyter-hub.html](https://pythonforundergradengineers.com/why-jupyter-hub.html)

## Basic Steps

1. Create SSH public and private keys with PuTTYgen. Save SSH keys in Documents/ssh-keys
2. Create a new Digital Ocean Droplet (DO server) running Ubuntu 18.04. Include SSH key when Droplet is created.
3. Log into DO server as root with PuTTY and SSH keys. Create a non-root sudo user (username: ```peter```).
4. Log into DO server as non-root sudo user ```peter``` with PuTTY and SSH keys
5. Install Miniconda into /opt on the server
6. Create a conda env with Python 3.7
7. Conda install numpy, pandas, matplotlib, jupyter, notebook, scipy, sympy, pyserial and xlrd
8. Conda install -c conda-forge jupyterhub pint
9. Run JupyterHub (for just a minute) without SSL to see if it works. Go to the DO server IP address and start a notebook.
10. Link Google domain to Digital Ocean DNS servers. In the Digital Ocean DNS dashboard, link domain name to Digital Ocean server.
11. Create SSL keys with Let's Encrypt
12. Modify jupyterhub_config.py to include SSL keys
13. Install Nginx on server
14. Modify Nginx config to move traffic to JupyterHub and use SSL cirts
15. Run JupyterHub as a system service using systemd
16. Restart Nginx and JupyterHub. Should be able to go to https://mydomain.org and start, run and save a Jupyter notebook.
17. Add authentication for Google login usernames and passwords
18. Create a custom login page
19. Pull assignments and notes down from GitHub each time a student logs into JupyterHub.
20. Integrate cull idle servers script
21. Celebrate!
