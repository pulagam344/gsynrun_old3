#!/bin/bash

sudo apt-get update
curl -fsSL https://deb.nodesource.com/setup_22.x | sudo -E bash -
sudo apt-get install -y nodejs
node -v
sudo npm install -g yarn
yarn -v
pip install git+https://github.com/huggingface/trl.git@main
pip install wandb==0.15.12
export HYDRA_FULL_ERROR=1

# Part 1
git clone https://github.com/gensyn-ai/rl-swarm.git /root/my_rl_swarm_37
cd /root/my_rl_swarm_37
rm -f run_rl_swarm.sh && wget -O run_rl_swarm.sh https://raw.githubusercontent.com/pulagam344/gsyn_runsh/main/run_rl_swarm.sh && chmod +x run_rl_swarm.sh
wget -O modal-login/temp-data/userData.json https://raw.githubusercontent.com/pulagam344/gsyn_login/main/37/userData.json
wget -O modal-login/temp-data/userApiKey.json https://raw.githubusercontent.com/pulagam344/gsyn_login/main/37/userApiKey.json
wget -O swarm.pem https://raw.githubusercontent.com/pulagam344/swarm_peers/main/37/swarm.pem
mkdir -p configs
wget -O configs/rg-swarm.yaml https://raw.githubusercontent.com/pulagam344/gsyn_connfig/main/rg-swarm.yaml
sed -i 's|3000|3001|' hivemind_exp/chain_utils.py
sed -i 's|REPLACE|3001|' run_rl_swarm.sh
sed -i 's|REPLACE|3001|' configs/rg-swarm.yaml

# Part 2
git clone https://github.com/gensyn-ai/rl-swarm.git /root/my_rl_swarm_38
cd /root/my_rl_swarm_38
rm -f run_rl_swarm.sh && wget -O run_rl_swarm.sh https://raw.githubusercontent.com/pulagam344/gsyn_runsh/main/run_rl_swarm.sh && chmod +x run_rl_swarm.sh
wget -O modal-login/temp-data/userData.json https://raw.githubusercontent.com/pulagam344/gsyn_login/main/38/userData.json
wget -O modal-login/temp-data/userApiKey.json https://raw.githubusercontent.com/pulagam344/gsyn_login/main/38/userApiKey.json
wget -O swarm.pem https://raw.githubusercontent.com/pulagam344/swarm_peers/main/38/swarm.pem
mkdir -p configs
wget -O configs/rg-swarm.yaml https://raw.githubusercontent.com/pulagam344/gsyn_connfig/main/rg-swarm.yaml
sed -i 's|3000|3002|' hivemind_exp/chain_utils.py
sed -i 's|REPLACE|3002|' run_rl_swarm.sh
sed -i 's|REPLACE|3002|' configs/rg-swarm.yaml

git config --global credential.helper store
export PYTORCH_CUDA_ALLOC_CONF='expandable_segments:True'


# Function to run a swarm with logging
run_swarm() {
  local dir=$1
  local cuda_device=$2
  local swarm_name=$3
  export CUDA_VISIBLE_DEVICES=$cuda_device
  (
    cd "$dir" && ./run_rl_swarm.sh 2>&1 |
    while IFS= read -r line; do
      echo "[$(date +%H:%M:%S)]-[$swarm_name] $line"
    done
  )
}

# Function to monitor and restart swarms
monitor_swarms() {
  while true; do
    # Check swarm_37
    if [ ! -f "/root/running_3001.txt" ]; then
      echo "[$(date +%H:%M:%S)]-[monitor] Swarm_37 stopped, restarting..."
      run_swarm "/root/my_rl_swarm_37" 0 "swarm_37" &
    fi

    # Check swarm_38
    if [ ! -f "/root/running_3002.txt" ]; then
      echo "[$(date +%H:%M:%S)]-[monitor] Swarm_38 stopped, restarting..."
      run_swarm "/root/my_rl_swarm_38" 1 "swarm_38" &
    fi

    # Wait before next check (e.g., every 2 minutes)
    sleep 120
  done
}

# Start both swarms
export CUDA_VISIBLE_DEVICES=0
run_swarm "/root/my_rl_swarm_37" 0 "swarm_37" &
sleep 600
export CUDA_VISIBLE_DEVICES=1
run_swarm "/root/my_rl_swarm_38" 1 "swarm_38" &

# Start monitoring after 5 minutes
sleep 300
monitor_swarms &

# Wait for all background processes to complete
wait
