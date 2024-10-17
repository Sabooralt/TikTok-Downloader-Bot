FROM python:3.10
WORKDIR /app
COPY requirements.txt /app/
RUN pip3 install -r requirements.txt
RUN apt-get update && apt-get install -y ntpdate \
    && ntpdate -s pool.ntp.org
COPY . /app
CMD ntpdate -s pool.ntp.org && python3 main.py
