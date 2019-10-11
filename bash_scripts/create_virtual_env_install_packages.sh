#!/bin/bash

echo "creating a conda environment"
conda create -n jupyterhub python=3.7
conda info --envs
echo "activating the jupyterhub environment"
conda activate jupyterhub
which python
echo "installing packages"
conda install numpy matplotlib pandas xlrd jupyter notebook
conda install -c conda-forge jupyterlab
conda install -c conda-forge jupyterhub
conda list
echo "packages installed"
