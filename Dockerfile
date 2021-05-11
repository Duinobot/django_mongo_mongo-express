From python
RUN apt-get update && apt install netcat -y
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

ENV APP_HOME=/var/www/html/icompose
RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME
COPY . $APP_HOME

RUN /usr/local/bin/python -m pip install --upgrade pip
RUN pip install -r requirements.txt

RUN chmod +x start.sh
ENTRYPOINT /bin/bash ./start.sh
