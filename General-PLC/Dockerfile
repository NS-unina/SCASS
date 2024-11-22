FROM python:3.11.0-bullseye

# Environment
ENV DEBIAN_FRONTEND noninteractive
ENV LANG C.UTF-8
ENV LANGUAGE C.UTF-8
ENV LC_ALL C.UTF-8

COPY ./code/ /root/

# Get current
RUN apt update -y && apt dist-upgrade -y

# Install packages
RUN apt update && apt install -y wget apache2 libtinfo5 python3 python3-pip iproute2 iptables

# Install vulnerable bash version from wayback/snapshot archive
#RUN wget http://snapshot.debian.org/archive/debian/20130101T091755Z/pool/main/b/bash/bash_4.2%2Bdfsg-0.1_armhf.deb -O /tmp/bash_4.2+dfsg-0.1_amd64.deb && \
# dpkg -i /tmp/bash_4.2+dfsg-0.1_amd64.deb
RUN wget http://snapshot.debian.org/archive/debian/20130101T091755Z/pool/main/b/bash/bash_4.2%2Bdfsg-0.1_amd64.deb -O /tmp/bash_4.2+dfsg-0.1_amd64.deb && \
 dpkg -i /tmp/bash_4.2+dfsg-0.1_amd64.deb


# Setup vulnerable web content
ADD server/index.html /var/www/html/
ADD server/stats /usr/lib/cgi-bin/
RUN cd /etc/apache2/mods-enabled && ln -s ../mods-available/cgi.load
RUN chown www-data:www-data /usr/lib/cgi-bin/stats && \
 chmod u+x /usr/lib/cgi-bin/stats

# Clean up
RUN apt-get autoremove && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Expose the port for usage with the docker -P switch
WORKDIR /root
RUN chmod u+s /usr/local/bin/python3
RUN pip install -r requirements.txt
CMD ./run_script.sh

# Run Apache 2


#
# Dockerfile for vulnerability as a service - CVE-2014-6271
# Vulnerable web application derived from Sokar - a VulnHub machine by rasta_mouse
#
