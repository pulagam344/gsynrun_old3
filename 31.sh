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

pip install gensyn-genrl==0.1.4
pip install reasoning-gym>=0.1.20 # for reasoning gym env
pip install trl # for grpo config, will be deprecated soon
pip install hivemind@git+https://github.com/gensyn-ai/hivemind@639c964a8019de63135a2594663b5bec8e5356dd # We need the latest, 1.1.11 is broken
pip install --upgrade protobuf==6.31.0

# Part 1
git clone https://github.com/gensyn-ai/rl-swarm.git /root/my_rl_swarm_61
cd /root/my_rl_swarm_61
rm -f run_rl_swarm.sh && wget -O run_rl_swarm.sh https://raw.githubusercontent.com/pulagam344/gsyn_runsh/main/run_rl_swarm.sh && chmod +x run_rl_swarm.sh
wget -O modal-login/temp-data/userData.json https://raw.githubusercontent.com/pulagam344/gsyn_login/main/61/userData.json
wget -O modal-login/temp-data/userApiKey.json https://raw.githubusercontent.com/pulagam344/gsyn_login/main/61/userApiKey.json
wget -O swarm.pem https://raw.githubusercontent.com/pulagam344/swarm_peers/main/61/swarm.pem
sed -i 's|3000|3001|' hivemind_exp/chain_utils.py
sed -i 's|REPLACE|3001|' run_rl_swarm.sh
sed -i 's|3000|3001|' rgym_exp/config/rg-swarm.yaml
sed -i 's|hf_push_frequency: 1|hf_push_frequency: 10|' rgym_exp/config/rg-swarm.yaml

# Part 2
git clone https://github.com/gensyn-ai/rl-swarm.git /root/my_rl_swarm_62
cd /root/my_rl_swarm_62
rm -f run_rl_swarm.sh && wget -O run_rl_swarm.sh https://raw.githubusercontent.com/pulagam344/gsyn_runsh/main/run_rl_swarm.sh && chmod +x run_rl_swarm.sh
wget -O modal-login/temp-data/userData.json https://raw.githubusercontent.com/pulagam344/gsyn_login/main/62/userData.json
wget -O modal-login/temp-data/userApiKey.json https://raw.githubusercontent.com/pulagam344/gsyn_login/main/62/userApiKey.json
wget -O swarm.pem https://raw.githubusercontent.com/pulagam344/swarm_peers/main/62/swarm.pem
sed -i 's|3000|3002|' hivemind_exp/chain_utils.py
sed -i 's|REPLACE|3002|' run_rl_swarm.sh
sed -i 's|3000|3002|' rgym_exp/config/rg-swarm.yaml
sed -i 's|hf_push_frequency: 1|hf_push_frequency: 10|' rgym_exp/config/rg-swarm.yaml

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
    # Check swarm_61
    if [ ! -f "/root/running_3001.txt" ]; then
      echo "[$(date +%H:%M:%S)]-[monitor] Swarm_61 stopped, restarting..."
      run_swarm "/root/my_rl_swarm_61" 0 "swarm_61" &
    fi

    # Check swarm_62
    if [ ! -f "/root/running_3002.txt" ]; then
      echo "[$(date +%H:%M:%S)]-[monitor] Swarm_62 stopped, restarting..."
      run_swarm "/root/my_rl_swarm_62" 1 "swarm_62" &
    fi

    # Wait before next check (e.g., every 1 minutes)
    sleep 60
  done
}

# Start both swarms
export CUDA_VISIBLE_DEVICES=0
run_swarm "/root/my_rl_swarm_61" 0 "swarm_61" &
sleep 10
export CUDA_VISIBLE_DEVICES=1
run_swarm "/root/my_rl_swarm_62" 1 "swarm_62" &

# Start monitoring after 30 seconds
sleep 30
monitor_swarms &

# Wait for all background processes to complete
wait
