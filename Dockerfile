from python:latest

RUN apt-get update && apt-get install -y gettext-base
#RUN pip3 install telethon==1.6.2
RUN python3 -m pip install --upgrade pip
RUN python3 -m pip install --upgrade telethon==1.6.2

COPY autoreply.py.tpl /
COPY entrypoint.sh /

#ENTRYPOINT [ "/entrypoint.sh" ] 
ENTRYPOINT [ "sleep", "10000" ]
