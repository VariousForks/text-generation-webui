# Start with a base image
FROM continuumio/miniconda3:latest

# Update the base image
RUN apt-get update && apt-get upgrade -y && apt-get clean

# Install git
RUN apt-get install -y git build-essential

# Create a new environment
RUN conda create -y -n textgen python=3.10.9 

# Activate the environment and install PyTorch
SHELL ["conda", "run", "-n", "textgen", "/bin/bash", "-c"]
RUN pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cpu

# Clone the repository
RUN git clone https://github.com/oobabooga/text-generation-webui

# Install the requirements
RUN cd text-generation-webui && pip install -r requirements.txt

# Set the working directory
WORKDIR /text-generation-webui

# Add a script that creates the symbolic link and starts the server
ADD start.sh /start.sh
RUN chmod +x /start.sh

# Define the entrypoint
ENTRYPOINT ["/start.sh"]
