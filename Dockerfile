FROM pytorch/pytorch:1.5-cuda10.1-cudnn7-runtime
# pytorch/pytorch - Docker image
# https://github.com/pytorch/pytorch/blob/5baa6b6c34c9a61c936f90168b6449421814553d/Dockerfile

# The base image for pytorch/pytorch:1.5-cuda10.1-cudnn7-runtime
# is nvidia/cuda:10.1-cudnn7-devel-ubuntu16.04
# https://gitlab.com/nvidia/container-images/cuda/-/blob/d442ff6975fb8310da90e6c3f35a988b6920b017/dist/ubuntu16.04/10.1/devel/Dockerfile
# Go up each level to see the autogenerated Dockerfiles involved

# worth checking out: https://github.com/NVIDIA/nvidia-docker/tree/master/docker

LABEL maintainer="NdagiStanley"
WORKDIR /app

# Install system packages (Alternative way of installing ffmpeg)
# RUN apt update
# RUN apt install ffmpeg -y

# Install other python packages
RUN /opt/conda/bin/conda install -c conda-forge opencv scikit-image tqdm x264 ffmpeg
COPY . .
ENV input=example/a-bomb_blast_effects_part.mp4
ENV reference_dir=example/references/
ENV options="--gpu"

CMD ["python", "remaster.py", "--input", "$input", "--reference_dir", "$reference_dir", "$options"]
