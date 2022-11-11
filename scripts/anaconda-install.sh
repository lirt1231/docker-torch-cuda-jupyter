# !/bin/bash

conda_ins_scpt="anaconda_install.sh"

# Check if anaconda installation script exists
if [ -d "${CONDA_HOME}" ]; then
  echo "${CONDA_HOME} already exists, abort installation."
  exit 0
fi

cd /opt

echo "downloading ${conda_ins_scpt}"
wget -O ${conda_ins_scpt} https://mirrors.tuna.tsinghua.edu.cn/anaconda/archive/Anaconda3-2022.05-Linux-x86_64.sh
chmod +x ./${conda_ins_scpt}

cmd=""
for ((i=0; i<200; i++))
do
  cmd="${cmd}\n"
done
# Input yes
cmd="${cmd}yes\n"
# Input installation location
cmd="${cmd}${CONDA_HOME}\n"
# Input yes for conda init
cmd="${cmd}yes\n"

# nohup echo -e ${cmd} | ./${conda_ins_scpt} >> conda_install.log &
echo -e ${cmd} | ./${conda_ins_scpt} >> conda_install.log

# Create jupyter root dir
if [ ! -d ${JUPYTER_ROOT_DIR} ]; then
  echo "creating directory ${JUPYTER_ROOT_DIR}"
  mkdir ${JUPYTER_ROOT_DIR}
fi
