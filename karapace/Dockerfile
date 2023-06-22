FROM ubuntu:22.04

WORKDIR /app

RUN apt-get -y update && apt-get -y upgrade

RUN apt-get -y install tar curl python3
RUN apt-get -y install python3-pip git python3.10-venv
RUN cp /bin/python3 /bin/python
RUN cp /bin/pip3 /bin/pip

# install pyenv
RUN git clone https://github.com/pyenv/pyenv.git ~/.pyenv
ENV PATH="${PATH}:${HOME}/.pyenv/bin"
RUN eval "$(pyenv init -)"

# install karapace
RUN git clone https://github.com/aiven/karapace.git
WORKDIR /app/karapace

# you need to install dev deps apparently..
RUN pip install -r ./requirements/requirements-dev.txt
RUN pip install -r ./requirements/requirements.txt
ENV CI true
RUN make install

# optional
RUN apt-get -y install fish

CMD [ "/bin/bash" ]