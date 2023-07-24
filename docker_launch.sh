#!/bin/bash

docker run --gpus all -v data:/data -p 8000:8000 --rm vllm:v0.1.2-no-eos-stop --model lmsys/vicuna-7b-v1.3
