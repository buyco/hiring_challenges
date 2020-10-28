FROM python:3.7-buster

ENV PYTHONUNBUFFERED=1
RUN mkdir /code
WORKDIR /code
COPY requirements.txt /code/

RUN  adduser buyco --uid 1000 --no-create-home --disabled-password
RUN  chown -R buyco /code

RUN pip install -r requirements.txt
COPY . /code/
