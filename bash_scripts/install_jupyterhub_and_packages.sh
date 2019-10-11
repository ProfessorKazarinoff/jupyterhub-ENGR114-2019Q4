#!/bin/bash

echo "installing jupyterhub"
/opt/minconda/bin/conda activate jupyterhub

/opt/miniconda/bin/conda install -y numpy matplotlib pandas xlrd jupyter

/opt/miniconda/bin/conda install -c conda-forge -y jupyterlab
/opt/miniconda/bin/conda install -c conda-forge -y jupyterhub
/opt/miniconda/bin/conda list
echo "JupyterHub and packages installed"
