FROM python:3.8-slim-buster

RUN apt-get update && apt-get install -y gcc

ADD requirements.txt app/requirements.txt
RUN pip3 install -r app/requirements.txt
# This deals with SHA256_init symbol not found as per: https://github.com/Legrandin/pycryptodome/issues/505
RUN pip3 uninstall -y pycrypto
RUN pip3 install pycryptodome==3.10.1

ADD . /app

EXPOSE 5000
WORKDIR "/app"
CMD ["python3", "app.py"]
