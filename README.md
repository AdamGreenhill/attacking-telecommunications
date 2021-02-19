# LTE-attack-tools

The project contains scripts to download and install LTE attack tools and simulation labs.

## Tools

* SigPloit (https://github.com/SigPloiter/SigPloit): a tool that abuses vulnerabilities within the GTP protocol. The tool also can exploit SS7 vulnerabilities found in 2G and 3G networks.
* gtp_scan (http://www.ernw.de/download/gtp/gtp_scan-0.7.tar.gz): a tool designed to enumerate and scan GTP services in a network.
* apnbf (http://www.ernw.de/download/apnbf-0.1.tar.gz): a script that can be used to bruteforce access point names (APNs) that can be used to establish sessions in a network.
* s1ap_enum (https://insinuator.net/2014/06/new-tool-s1ap_enum/): a tool that attempts to bruteforce parameters against a host (such as an MME) and establish an s1ap session.
* diameter_enum (https://github.com/ernw/diameter_enum): this tool implements the Diameter protocol and can be used to scan related services
* pytackle (https://insinuator.net/2012/10/pytacle-alpha1-released/): tool designed to sniff GSM packets out of the air
* dizzy (https://github.com/ernw/dizzy): this is a framework capable of both stateful and stateless network protocol fuzzing. The project is built in parallel with scripts (https://github.com/ernw/dizzfiles) to assist with the fuzzing of various protocols like GTP, SIP, etc.

### Debian/Ubuntu

To download and install the tools, execute the following:

```
git clone https://github.com/AdamGreenhill/attacking-telecommunications
cd attacking-telecommunications/tools/installer
sudo bash install.sh
```

### Docker

To build the tools in a Dockerized environment, execute the following:

```
git https://github.com/AdamGreenhill/attacking-telecommunications
cd attacking-telecommunications/tools/docker
sudo docker build -t lte-attack .
```

## Labs

### 3G

The repository has the following ss7 labs (located at ./attacking-telecommunications/labs/3G):
* Using the SigPloit ss7/GTP penetration testing tool with its example lab
* jss7-attack-simulator to simulate attacks against SS7

### 4G-LTE

The repository has the following 4G-LTE labs (located at ./attacking-telecommunications/labs/4G-LTE):
* Simulated EPC with Open5GS
* Simulated full LTE stack with srsLTE 
