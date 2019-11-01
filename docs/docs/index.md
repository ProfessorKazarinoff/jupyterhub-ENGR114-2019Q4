# Welcome to the JupyterHub Deployment Docs for ENGR114 2019Q4

<br>

This documentation serves as a record of the JupyterHub Deployment for ENGR114 Fall 2019 at Portland Commmunity College. 

<br>

The GitHub repo for the deployment can be found here: 

 > [https://github.com/ProfessorKazarinoff/jupyterhub-ENGR114-2019Q4](https://github.com/ProfessorKazarinoff/jupyterhub-ENGR114-2019Q4)

<br>

Click the menu items on the left to view the deployment steps.

Or start [Here](setup.md) and click the arrows at the bottom of each page.

[![Next Setup Arrow](images/next_setup.png)](setup.md)

<br>

## What is JupyterHub?

JupyterHub is a cloud server-hosted distributed Jupyter notebook deployment. JupyterHub allows users to log into a server and write Python code within a web browswer without installing any software on their local machine. After JupyterHub is deployed, anywhere you have an internet connection, you can bring up a Jupyter notebook in your browser and write/run Python code. The Jupyter notebook interface that JupyterHub provides is the same Jupyter notebook interface you can run locally. Because JupyterHub runs in a web browser, it even works on tablets and phones.

## Why JupyterHub?

Why **Jupyter Hub**? I am teaching an engineering programming course Fall of 2019. In previous quarters, I've taught MATLAB for the programming class. But this fall, I am teaching **Python** and cover the same concepts and learning outcomes.

When we use **Python** in the class this Fall, I would like to spend the class time coding and solving problems. I don't want to spend time during class downloading Python, creating virtual environments, troubleshooting installs, dealing with system vs. non-system versions of Python, installing packages, dealing with folder structure, explaining the difference between conda and pip, teaching command-line arguments, going over Python on Windows compared to Python on MacOS... The solution is to use JupyterHub.

A [series of blog posts](https://pythonforundergradengineers.com/why-jupyter-hub.html) documents my first JupyterHub deployment in Summer 2018. This documentation builds upon that previous experience.

A [deployment of JupyterHub Winter 2019](https://professorkazarinoff.github.io/jupyterhub-engr114/) documents by second JupyterHub installation. This documentation closely follows the same steps with only a few minor alterations.


## Main Steps

* Install PuTTY, generate SSH keys
* Create a new Ubuntu 18.04 server on Digital Ocean
* Install JupyterHub and Python packages
* Aquire and link domain name to server
* Aquire SSL cirt
* Create Cookie Secret, Proxy Auth Token, and dhparam.pem
* Install and configure Nginx
* Configure JupyterHub
* Google Authentication
* Create a custom login page
* Cull idle servers script

<br>
