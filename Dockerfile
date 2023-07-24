FROM nvidia/cuda:11.8.0-devel-ubuntu20.04 as base

# install python3
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*

# upgrade pip
RUN python3 -m pip install --upgrade pip

WORKDIR /workspace

ENV HUGGINGFACE_HUB_CACHE=/data
COPY . .

# install vllm
RUN python3 -m pip install .

# remove the vllm folder
RUN rm -rf vllm

ENTRYPOINT ["python3", "-m", "vllm.entrypoints.openai.api_server"]
CMD ["--help"]
