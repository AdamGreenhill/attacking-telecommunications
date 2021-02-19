FROM ubuntu:bionic as base

RUN apt-get update && \
# Installing necessary packages
apt-get install -y \
git \
nmap \
iputils-ping \
python \
python-pip \
openjdk-8-jdk \
maven \
lksctp-tools \
libsctp-dev \
libsctp1 \
wget \
bzip2 && \
mkdir -p /opt/ && \
# Setting up SigPloit
git clone https://github.com/SigPloiter/SigPloit /opt/sigploit && \
cd /opt/sigploit && \
pip2 install -r requirements.txt && \
# Setting up ss7MAPery
wget https://github.com/ernw/ss7MAPer/raw/master/releases/ss7MAPer-v0.2_linux_x64.tar.bz2 -O /opt/ss7MAPer-v0.2_linux_x64.tar.bz2 && \
mkdir -p /opt/ss7maper-v0.2 && \
tar xvf /opt/ss7MAPer-v0.2_linux_x64.tar.bz2 --directory /opt/ss7maper-v0.2 && \
rm /opt/ss7MAPer-v0.2_linux_x64.tar.bz2 && \
# Setting up gtp_scan
wget http://www.ernw.de/download/gtp/gtp_scan-0.7.tar.gz -O /opt/gtp_scan-0.7.tar.gz && \
mkdir -p /opt/gtp_scan-0.7 && \
tar xvf /opt/gtp_scan-0.7.tar.gz --directory /opt/gtp_scan-0.7 && \
rm /opt/gtp_scan-0.7.tar.gz && \
# Setting up apnbf
wget http://www.ernw.de/download/apnbf-0.1.tar.gz -O /opt/apnbf-0.1.tar.gz && \
mkdir -p /opt/apnbf-0.1 && \
tar xvf /opt/apnbf-0.1.tar.gz --directory /opt/apnbf-0.1 && \
rm /opt/apnbf-0.1.tar.gz && \
# Setting up s1ap_enum
wget https://www.ernw.de/download/s1ap_enum_v0.1.tar.bz2 -O /opt/s1ap_enum_v0.1.tar.bz2 && \
mkdir -p /opt/s1ap_enum_v0.1 && \
tar xvf /opt/s1ap_enum_v0.1.tar.bz2 --directory /opt/s1ap_enum_v0.1 && \
rm /opt/s1ap_enum_v0.1.tar.bz2 && \
# Setting up diameter_enum
git clone https://github.com/ernw/diameter_enum /opt/diameter_enum && \
# Setting up PyTacle
wget http://www.ernw.de/download/pytacle-alpha2.tar.gz -O /opt/pytacle-alpha2.tar.gz && \
mkdir /opt/pytacle-alpha2 && \
tar xvf /opt/pytacle-alpha2.tar.gz --directory /opt/pytacle-alpha2 && \
rm /opt/pytacle-alpha2.tar.gz && \
# Setting up the Dizzy fuzzing framework
git clone https://github.com/ernw/dizzy /opt/dizzy-0.6 && \
git clone https://github.com/ernw/dizzfiles /opt/dizzfiles

ENTRYPOINT [ "tail", "-f", "/dev/null" ]
