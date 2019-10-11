#!/bin/bash

echo "creating a conda environment"
/opt/miniconda/bin/conda create -n jupyterhub -y python=3.7
/opt/miniconda/bin/conda info --envs
echo "conda environment created"

