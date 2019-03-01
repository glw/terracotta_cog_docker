FROM python:3.6
WORKDIR /
RUN apt-get update && \
apt-get install -y git \
&& \
wget https://bootstrap.pypa.io/get-pip.py \
&& \
python3.6 get-pip.py --user \
&& \
git clone https://github.com/DHI-GRAS/terracotta.git \
&& \
cd terracotta \
&& \
pip install -r zappa_requirements.txt \
&& \
pip install -e .
# Externally accessible data is by default put in /data
WORKDIR /data
CMD ["/bin/bash"]
