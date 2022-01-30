FROM nvcr.io/nvidia/pytorch:21.12-py3

RUN conda install -c conda-forge numpy
RUN conda install -c conda-forge pandas
RUN conda install -c conda-forge keras
# RUN conda install -c conda-forge tensorflow=2.6.0

# Setting up non-root 
ARG GID=1000
ARG UID=1000
ARG MY_USERNAME=derek
ARG MY_PWS=myPassword

RUN addgroup --gid $GID $MY_USERNAME
RUN useradd --system --create-home --shell /bin/bash --groups sudo -p "$(openssl passwd -1 $MY_PWS)" --uid $UID --gid $GID $MY_USERNAME
USER $MY_USERNAME
WORKDIR /home/$MY_USERNAME
