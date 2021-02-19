# Open5GS


On an Ubuntu/Debian OS execute `installer.sh` to download and install Docker and Kuberetes to build out an Open5GS LTE stack.

Make sure to update the system:

```
sudo apt-get update
sudo apt-get upgrade -y
sudo reboot
```

Accessing the attack tools via kerberos can be achieved through the following:

```

$ kubectl exec -it --namespace=open5gs attack-tools -- /bin/bash

root@attack-tools-6c7d86596c-klsp4:/# ping 192.168.243.211
PING 192.168.243.211 (192.168.243.211) 56(84) bytes of data.
64 bytes from 192.168.243.211: icmp_seq=1 ttl=63 time=0.134 ms
64 bytes from 192.168.243.211: icmp_seq=2 ttl=63 time=0.086 ms
64 bytes from 192.168.243.211: icmp_seq=3 ttl=63 time=0.063 ms
64 bytes from 192.168.243.211: icmp_seq=4 ttl=63 time=0.108 ms
64 bytes from 192.168.243.211: icmp_seq=5 ttl=63 time=0.089 ms
64 bytes from 192.168.243.211: icmp_seq=6 ttl=63 time=0.115 ms
64 bytes from 192.168.243.211: icmp_seq=7 ttl=63 time=0.086 ms
64 bytes from 192.168.243.211: icmp_seq=8 ttl=63 time=0.078 ms
```

References:
* https://www.kubermatic.com/blog/virtual-4g-simulation-using-kubernetes-and-gns3/
* https://docs.projectcalico.org/getting-started/kubernetes/quickstart
