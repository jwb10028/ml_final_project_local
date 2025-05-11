FROM python:3.7-buster


RUN apt-get update && apt-get install -y \
      build-essential \
      python3-dev \
      ffmpeg \
      libsndfile1 \
      libasound2-dev \
      libffi-dev \
      git \
      wget \
  && rm -rf /var/lib/apt/lists/*


RUN pip install --upgrade pip && \
    pip install \
      tensorflow==2.11 \
      crepe \
      ddsp==1.6.5 \
      jupyter \
      matplotlib \
      librosa


RUN git clone https://github.com/magenta/ddsp.git /ddsp-full && \
    pip install -e /ddsp-full


RUN apt-get update && apt-get install -y \
      sox \
      libsox-dev \
      libsox-fmt-all \
      libjack-jackd2-dev \
  && rm -rf /var/lib/apt/lists/*


RUN pip install magenta==2.1.0

WORKDIR /workspace
EXPOSE 8888

CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--allow-root", "--NotebookApp.token=''"]
