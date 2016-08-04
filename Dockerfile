FROM python:2.7
MAINTAINER Daniel Werner <dan.werner@gmail.com>

RUN mkdir -p /var/lib/conan_server && useradd -r conan -d /var/lib/conan_server -m
RUN apt-get update \
 	&& apt-get -y install git \
	&& git clone https://github.com/conan-io/conan.git \
	&& cd conan \
	&& git checkout master \
	&& pip install -r conans/requirements.txt \
	&& pip install -r conans/requirements_server.txt \
	&& pip install gunicorn

# Run uwsgi listening on port 8080
EXPOSE 9300
CMD ["su", "-c", "/usr/local/bin/gunicorn -b 0.0.0.0:9300 -w 4 -t 120 conans.server.server_launcher:app", "conan"]
