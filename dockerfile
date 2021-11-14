FROM nvcr.io/nvidia/pytorch:21.10-py3

RUN conda install -c conda-forge pandas

# Setting up derek as the user 
ARG GID=1000
ARG UID=1000
RUN addgroup --gid $GID derek
RUN useradd --system --create-home --shell /bin/bash --groups sudo -p "$(openssl passwd -1 my-password)" --uid $UID --gid $GID derek
USER derek
WORKDIR /home/derek
