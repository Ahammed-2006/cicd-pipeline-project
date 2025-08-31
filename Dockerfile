# Use lightweight Nginx image
FROM nginx:alpine

# Copy everything from repo root into nginx html folder
COPY . /usr/share/nginx/html/

# Expose port 80 for serving
EXPOSE 80
