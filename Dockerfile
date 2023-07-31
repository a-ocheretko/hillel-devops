# use Alpine-based Nginx image
FROM nginx:1.25.1-alpine3.17

# copy static HTML page into container
COPY index.html /usr/share/nginx/html/

# run Nginx
CMD ["nginx", "-g", "daemon off;"]
