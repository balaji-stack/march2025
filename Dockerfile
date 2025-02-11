FROM nginx:latest
COPY devops.html /usr/share/nginx/html/devops.html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]

