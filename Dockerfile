# docker buildx build --platform linux/amd64 -t lukasweibel99/lens-less . --load
# docker run --name lens-less -p 9001:80 -d lukasweibel99/lens-less

FROM python:3.12.1

WORKDIR /usr/src/app

COPY . .

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

EXPOSE 80
ENV FLASK_APP=/usr/src/app/api/service.py
CMD [ "python", "-m" , "flask", "run", "--host=0.0.0.0", "--port=80"]