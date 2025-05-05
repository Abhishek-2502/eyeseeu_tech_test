# Use official Nginx image as base
FROM nginx:alpine

# Set working directory
WORKDIR /usr/share/nginx/html

# Copy website files into the Nginx public folder
COPY . .

# Copy custom Nginx config for SSL
COPY default.conf /etc/nginx/conf.d/default.conf

# Copy SSL certificates
COPY eyeseeu_tld.key /etc/ssl/private/eyeseeu_tld.key
COPY fullchain.pem /etc/ssl/certs/fullchain.pem

# Expose HTTP (80) and HTTPS (443) ports
EXPOSE 80
EXPOSE 443

# No CMD needed, Nginx runs by default



# docker build -t my-static-site .
# docker run -d -p 443:443 -p 80:80 my-static-site
