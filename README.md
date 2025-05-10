RUN w GPU:
docker build -f Dockerfile.gpu -t ddsp-gpu .
docker run --gpus all -p 8888:8888 -v "${PWD}:/workspace" ddsp-gpu



RUN w CPU:
docker build -t ddsp-cpu .
docker run -p 8888:8888 -v "${PWD}:/workspace" ddsp-cpu
