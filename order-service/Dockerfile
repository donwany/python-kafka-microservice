FROM python:3.8-alpine
ENV PYTHONUNBUFFERED 1
WORKDIR /app
COPY requirements.txt /app/requirements.txt
RUN pip install -r requirements.txt
COPY order_svc.py /app

CMD ["python","order_svc.py"]