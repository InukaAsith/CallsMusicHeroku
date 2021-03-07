FROM debian:latest

RUN apt update && apt upgrade -y
RUN apt install git curl python3-pip ffmpeg -y
RUN pip3 install -U pip
RUN curl -sL https://deb.nodesource.com/setup_15.x | bash -
RUN apt-get install -y nodejs
RUN npm i -g npm
RUN cd / && \
    git clone -b CallsMusic https://github.com/TeamDaisyX/Daisy-X DaisyX && \
    cd DaisyX/ && \
    rm -r .git && \
    git clone https://github.com/pytgcalls/pytgcalls && \
    cd pytgcalls/ && \
    rm -r .git && \
    npm install && \
    npm run prepare && \
    cd pytgcalls/js && \
    npm install && \
    cd ../../ && \
    pip3 install -r requirements.txt && \
    cd /DaisyX && \
    pip3 install -U -r requirements.txt
WORKDIR /DaisyX
CMD ["python3","-m","DaisyX"]
