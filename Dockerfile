FROM nginx:latest
COPY Dockerfile /usr/share/nginx/html/
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]

