#!/bin/sh

# command to start docker container (without labsmanager) 
DATA_DIR=/HPCPool/projects/lrn_cdc
DB_DIR=/data/projects/microbial_projects/s2fast

docker run --rm -v $DB_DIR:/dbs:ro --name=Epi2Me-Labs-Server-$USER \
--volume=$DATA_DIR:/epi2melabs/:rw --user=1000 --mac-address=02:42:ac:11:00:02 --env=JUPYTER_ENABLE_LAB=yes --env=PATH=/home/jovyan/.local/bin/:/opt/conda/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin --env=DEBIAN_FRONTEND=noninteractive --env=CONDA_DIR=/opt/conda --env=SHELL=/bin/bash --env=NB_USER=jovyan --env=NB_UID=1000 --env=NB_GID=100 --env=LC_ALL=en_US.UTF-8 --env=LANG=en_US.UTF-8 --env=LANGUAGE=en_US.UTF-8 --env=HOME=/home/jovyan --env=CONDA_VERSION=4.9.2 --env=MINIFORGE_VERSION=4.9.2-5 --env=NB_HOST_USER=nbhost --env=XDG_CACHE_HOME=/home/jovyan/.cache/ --workdir=/home/jovyan -p 8888:8888 -p 8889:8889 --label='maintainer=Oxford Nanopore Technologies' --add-host host.docker.internal:host-gateway --runtime=runc --detach=true scholzmb/cdc_lrn:0.1.1 run_as_user.sh $(id -u) start-notebook.sh --NotebookApp.port_retries=0 --no-browser --notebook-dir=/ --NotebookApp.token=sigsciLRN --Epi2melabsWFPage.remote=true --Epi2melabsWFPage.workflows_dir=/epi2me-resources/workflows/ --Epi2melabsWFPage.base_dir=/epi2melabs//nextflow --Epi2melabsWFPage.ip=host.docker.internal --Epi2melabsWFPage.port=8890 --port=8888
