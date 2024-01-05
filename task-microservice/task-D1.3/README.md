# Docker Swarm

### Install Docker and Docker Compose
```Bash
sudo apt update
sudo apt install curl build-essential git wget jq tmux chrony -y
sudo -i
curl -fsSL https://get.docker.com -o get-docker.sh && sh get-docker.sh
systemctl restart docker
curl -SL https://github.com/docker/compose/releases/download/v2.23.3/docker-compose-darwin-x86_64 -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
exit
```
### Check install
```Bash
sudo docker version
sudo docker-compose version
```
### Create new swarm
```Bash
sudo docker swarm init
```
### Get the join command for a worker (run om manager)
```Bash
sudo docker swarm join-token worker
```
### Add nodes to swarm (run on worker)
```Bash
sudo docker swarm join --token SWMTKN-1-2b6b6sb3uxtrhvmcx19durseth780u60qivb4scoz8xjgekygq-4ehgkqlxcpknteax0awsdnvll 192.168.0.29:2377
```
### Check nodes
```Bash
sudo docker node ls
```
### Deploy a stack to a swarm (run on manager)
```Bash
sudo docker stack deploy --compose-file ~/docker-compose.yml "stack_name"
```
### Check services
```Bash
sudo docker service ls
```
### Show on which node which service is running
```Bash
sudo docker stack ps "stack_name"
```
