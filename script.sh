#!/bin/bash

docker stop samrun 2>/dev/null || true
docker rm samrun 2>/dev/null || true

cat > Dockerfile << 'EOF'
FROM python:3
RUN pip install Flask
WORKDIR /home/app
COPY server.py .
EXPOSE 8090
CMD ["python", "server.py"]
EOF

docker build -t sample .

docker run -d -p 8090:8090 --name samrun sample

echo "----------------------------------------"
echo "¡Despliegue exitoso!"
echo "Accede a: http://$(curl -s ifconfig.me):8090"
echo "----------------------------------------"
