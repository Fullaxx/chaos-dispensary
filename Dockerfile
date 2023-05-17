# ------------------------------------------------------------------------------
# Install build tools and compile CHAOSgen
FROM debian:bullseye-slim AS build
RUN apt-get update && \
	apt-get install -y build-essential git ca-certificates \
	  libgcrypt-dev libhiredis-dev libmicrohttpd-dev && \
	git clone https://github.com/Fullaxx/CHAOSgen.git code && \
	cd /code/src && ./compile_chaosservice.sh

# ------------------------------------------------------------------------------
# Pull base image
FROM redis:latest
MAINTAINER Brett Kuskie <fullaxx@gmail.com>

# ------------------------------------------------------------------------------
# Set environment variables
ENV DEBIAN_FRONTEND noninteractive

# ------------------------------------------------------------------------------
# Prepare the OS
RUN apt-get update && \
	apt-get install -y --no-install-recommends \
	  libgcrypt20 libhiredis0.14 libmicrohttpd12 \
	  ca-certificates curl supervisor && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/* /var/tmp/* /tmp/*

# ------------------------------------------------------------------------------
# Prepare the image
COPY --from=build /code/src/*.exe /usr/local/bin/
COPY redis.conf /usr/local/etc/redis/redis.conf
COPY supervisord.conf /etc/supervisord.conf
COPY healthcheck.sh /app/
RUN mkdir /run/redis /var/log/redis && \
	chown -R redis.redis /run/redis /var/log/redis /usr/local/etc/redis

# ------------------------------------------------------------------------------
# Identify Ports
EXPOSE 8080

# ------------------------------------------------------------------------------
# Specify HealthCheck
HEALTHCHECK CMD /app/healthcheck.sh

# ------------------------------------------------------------------------------
# Define default command
CMD ["supervisord", "-c", "/etc/supervisord.conf"]
