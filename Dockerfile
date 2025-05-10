FROM python:3.7-slim

# Install system dependencies
RUN apt-get update && apt-get install -y \
    ffmpeg libsndfile1 git wget curl && \
    rm -rf /var/lib/apt/lists/*

# Python dependencies
RUN pip install --upgrade pip && \
    pip install tensorflow==2.11 ddsp==1.6.5 jupyter matplotlib librosa crepe

# Add full training functionality
RUN git clone https://github.com/magenta/ddsp.git /ddsp-full
RUN pip install -e /ddsp-full

# Set up workspace
WORKDIR /workspace
EXPOSE 8888

CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--allow-root", "--NotebookApp.token=''", "--NotebookApp.disable_check_xsrf=True"]
