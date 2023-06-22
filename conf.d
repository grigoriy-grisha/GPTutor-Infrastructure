# Redirect HTTP requests to HTTPS
server {
  listen 80;
  server_name gptutor.space www.gptutor.space;
  return 301 https://$host$request_uri;
}

# HTTPS server configuration
server {
  listen 443 ssl;
  server_name gptutor.space www.gptutor.space;

  # SSL configuration
  ssl_certificate /etc/nginx/certs/fullchain.pem;
  ssl_certificate_key /etc/nginx/certs/privkey.pem;

  # Proxy API and WebSocket requests to backend container
  location /api/ {
    proxy_pass http://backend:8080/;
    proxy_set_header Upgrade $http_upgrade;
    proxy_set_header Connection "Upgrade";
  }

  # Proxy WebSocket requests to backend container
  location /websocket/ {
    proxy_pass http://backend:8080/websocket/;
    proxy_http_version 1.1;
    proxy_set_header Upgrade $http_upgrade;
    proxy_set_header Connection "Upgrade";
  }

  # Serve static files for the frontend React app
  location / {
    root /usr/share/nginx/html;
    index index.html;
    try_files $uri $uri/ /index.html;
  }
}
