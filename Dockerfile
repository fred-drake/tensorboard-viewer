from python:3.9.10 as base
ENV POETRY_VERSION=1.1.12
ENV POETRY_HOME=/usr/local
RUN curl -sSL https://install.python-poetry.org | python3 -

from base as development

from base as builder
WORKDIR /app
COPY poetry.lock .
COPY poetry.toml .
COPY pyproject.toml .
RUN poetry install --no-dev
EXPOSE 6006
CMD [ "tensorboard", "--logdir", "/logs", "--bind_all" ]

