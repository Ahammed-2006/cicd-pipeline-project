# Use official Nginx image
FROM nginx:alpine

# Copy website files into nginx html directory
COPY src/ /usr/share/nginx/html/

# Expose port 80
EXPOSE 80

# Run nginx
CMD ["nginx", "-g", "daemon off;"]
