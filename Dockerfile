FROM python:latest
WORKDIR /app
COPY requirements.txt /app/
RUN pip3 install -r requirements.txt
COPY . /app
CMD python3 main.py
