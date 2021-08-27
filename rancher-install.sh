#/bin/bash 

#instalando rancher:

echo "instalando docker rancher" 
curl https://releases.rancher.com/install-docker/19.03.sh | sh
usermod -aG docker ubuntu

sleep(5)

echo "instalando docker-composer" 
sleep (10)
apt-get install git -y
curl -L "https://github.com/docker/compose/releases/download/1.25.5/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && chmod +x /usr/local/bin/docker-compose
ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

echo "verificando versao do composer e composer"
docker --version && docker-compose --version 

#docker 

echo "iniciará o processo de instalação do container rancher"
docker ps -a
docker run -d --name rancher --restart=unless-stopped -v /opt/rancher:/var/lib/rancher  -p 80:80 -p 443:443 rancher/rancher:v2.4.3
sleep(10)

