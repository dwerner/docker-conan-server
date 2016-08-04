FROM python:2.7
MAINTAINER David Kruger <david@viavisolutions.com>

# Install dependencies so they get cached with the image
RUN pip install --no-cache-dir conan
RUN useradd -r conan -d /var/lib/conan -m

# Run uwsgi listening on port 8080
EXPOSE 9300
CMD ["su", "-c", "/usr/local/bin/conan_server", "conan"]
