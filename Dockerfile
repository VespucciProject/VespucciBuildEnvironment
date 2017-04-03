FROM ubuntu:xenial
MAINTAINER Daniel P. Foose <dpfoose@gmail.com>
COPY . /build
RUN chmod +x /build/get_dependencies.sh && ./build/get_dependencies.sh
