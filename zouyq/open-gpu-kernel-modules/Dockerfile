FROM ubuntu
RUN apt update && apt install git gcc g++ make -y
RUN git clone https://github.com/NVIDIA/open-gpu-kernel-modules.git
WORKDIR open-gpu-kernel-modules
RUN make modules -j4
