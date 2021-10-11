FROM rasa/rasa
USER root
ENV BOT_ENV=development
COPY . /var/www
WORKDIR /var/www
RUN apt install python==3.6.15
RUN pip3 install rasa=1.8.0
RUN rasa train

ENTRYPOINT ["rasa", "run", "-p", "8080", "--debug", "-vv", "--enable-api", "-m", "models", "--cors", "*", "actions"]
