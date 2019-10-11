#!/bin/bash



echo "pulling down the miniconda installer"
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O /tmp/miniconda.sh
echo "Miniconda installer downloaded"

echo "modifying permissions"
chmod +x /tmp/miniconda.sh
ls -la
echo "permissions modified"

echo "installing Miniconda"
bash /tmp/miniconda.sh -b -p /opt/miniconda
eval "$(/opt/miniconda/bin/conda shell.bash hook)"
/opt/miniconda/bin/conda init
source $HOME/.bashrc
echo "minconda installed"

echo "chaning Miniconda permissions"
ls -la /opt
chmod -R g+w /opt/miniconda3/
ls -la /opt
chown -R root:peter /opt/miniconda3/
ls -la /opt
echo "permissions changed"

echo "checking conda version"
conda --version
