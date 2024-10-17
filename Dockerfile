FROM python:latest
WORKDIR /app

# Install dependencies and required packages
COPY requirements.txt /app/
RUN pip3 install -r requirements.txt
RUN apt-get update && apt-get install -y chrony tzdata

# Time synchronization using chrony and setting timezone to UTC
RUN chronyd -q 'server pool.ntp.org iburst'
RUN ln -fs /usr/share/zoneinfo/Etc/UTC /etc/localtime && dpkg-reconfigure -f noninteractive tzdata

# Copy application files
COPY . /app

# Time sync on container start and run the app
CMD chronyd -q 'server pool.ntp.org iburst' && python3 main.py
