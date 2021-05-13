FROM python:3.8-slim-buster

RUN pip3 install pipenv
RUN sudo apt-get update
RUN sudo apt-get install python3-pip
RUN pip3 install --upgrade pip
RUN pip3 install flask

ENV PROJECT_DIR /usr/src/flaskbookapi

WORKDIR ${PROJECT_DIR}

COPY Pipfile .
COPY Pipfile.lock .
COPY . .

RUN pipenv install --deploy --ignore-pipfile

EXPOSE 5000

CMD ["pipenv", "run", "python", "api.py"]