#  Base Image 
FROM ubuntu:16.04

# Who's the maintainer
MAINTAINER Amit Vashist <amitvashist7@outlook.com>

# Update the APT Repo 
RUN apt-get update 

# Install Apache Packages 
RUN apt-get install apache2 -y 

# Expose to Port
EXPOSE 80

# Deploy the index page
COPY index.html /var/www/html/index.html 

# Bring Up Apache Service
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND" ]