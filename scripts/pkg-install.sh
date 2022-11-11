# !/bin/bash

source ${CONDA_HOME}/bin/activate

pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple

pip install jupyter-lsp \
    jupyterlab-lsp \
    python-language-server[all] \
    nb_mypy \
    jupyterlab_execute_time \
    memory_profiler \
    ipywidgets \
    jupyterlab-code-formatter \
    black \
    isort \
    ipython-sql \
    torch \
    torchvision \
    torchaudio

jupyter-lab --generate-config
