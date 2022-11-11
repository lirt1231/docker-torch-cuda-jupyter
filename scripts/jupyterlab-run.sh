# !/bin/bash

source ${CONDA_HOME}/bin/activate

ps -ef | grep "jupyter-lab --allow-root" | grep -v grep
if [ $? -ne 0 ]; then
    echo "starting jupyterlab"
    jupyter-lab --allow-root > /root/jupyterlab.log
else
    echo "jupyterlab is running"
fi
