FROM python:3.10
LABEL authors="dianfer19"
ENV PYTHONUNBUFFERED 1
WORKDIR /app
COPY . /app
RUN pip install -r requirements.txt
RUN chmod +x /app/entrypoint.sh
CMD ["/app/entrypoint.sh"]
