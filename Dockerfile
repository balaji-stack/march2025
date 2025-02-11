FROM nginx:latest
COPY index.html /usr/share/nginx/html/devops
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]

