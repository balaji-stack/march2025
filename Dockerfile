# Use Apache HTTPD as base image
FROM httpd:latest

# Copy static website files (index.html, etc.)
COPY ./public-html/ /usr/local/apache2/htdocs/

# Expose port 80 for HTTP traffic
EXPOSE 80

# Start Apache server
CMD ["httpd-foreground"]
