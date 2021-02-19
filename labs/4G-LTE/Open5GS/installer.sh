# Install Docker
sudo apt-get remove -y docker docker-engine docker.io containerd runc
sudo apt-get install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository  "deb [arch=amd64] https://download.docker.com/linux/ubuntu  $(lsb_release -cs)  stable"
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io

# Install Kubernetes and Calico
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
cat <<EOF | sudo tee /etc/apt/sources.list.d/kubernetes.list
deb https://apt.kubernetes.io/ kubernetes-xenial main
EOF
sudo apt-get update
sudo apt-get install -y kubelet kubeadm kubectl
sudo apt-mark hold kubelet kubeadm kubectl
sudo swapoff -a
sudo kubeadm init --pod-network-cidr=192.168.0.0/16
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
kubectl create -f https://docs.projectcalico.org/manifests/tigera-operator.yaml
kubectl create -f https://docs.projectcalico.org/manifests/custom-resources.yaml
sleep 60
kubectl taint nodes --all node-role.kubernetes.io/master-

# Setup the environment
git clone https://bitbucket.org/infinitydon/virtual-4g-simulator/
cd virtual-4g-simulator/open5gs
kubectl create ns open5gs
kubectl apply -f hss-database/
sleep 60
kubectl apply -f hss/
kubectl apply -f mme/
kubectl apply -f sgw/
kubectl apply -f pgw/
kubectl apply -f pcrf/
kubectl apply -f web-ui/
kubectl apply -f ./attack-tools-deploy.yaml
sleep 60
kubectl -n open5gs get po -o wide
 
# Build OpenAirInterface Simulator
cd ../..
git clone https://gitlab.eurecom.fr/oai/openairinterface5g
cd openairinterface5g
export OPENAIR_HOME="`pwd`"
git checkout v1.2.1
cd cmake_targets
./build_oai --eNB --UE -c -I 
