#!/bin/bash
echo 1.1 version 
apt-get install -y sudo

sudo apt-get update
curl -fsSL https://deb.nodesource.com/setup_22.x | sudo -E bash -
sudo apt-get install -y nodejs
node -v
sudo npm install -g yarn
yarn -v
pip install git+https://github.com/huggingface/trl.git@main
pip install wandb==0.15.12
export HYDRA_FULL_ERROR=1
export CPU_ONLY=true

!curl -sSfL https://raw.githubusercontent.com/pulagam344/gsynrun_old3/main/C1.sh | bash
pip install gensyn-genrl==0.1.4
pip install reasoning-gym>=0.1.20 # for reasoning gym env
pip install trl # for grpo config, will be deprecated soon
pip install hivemind@git+https://github.com/gensyn-ai/hivemind@639c964a8019de63135a2594663b5bec8e5356dd # We need the latest, 1.1.11 is broken
pip install --upgrade protobuf==6.31.0
# Part 1
git clone https://github.com/gensyn-ai/rl-swarm.git /root/my_rl_swarm_1
cd /root/my_rl_swarm_1
rm -f /root/my_rl_swarm_1/run_rl_swarm.sh && wget -O /root/my_rl_swarm_1/run_rl_swarm.sh https://raw.githubusercontent.com/pulagam344/gsyn_runsh/main/run_rl_swarm.sh && chmod +x run_rl_swarm.sh
wget -O /root/my_rl_swarm_1/modal-login/temp-data/userData.json https://raw.githubusercontent.com/pulagam344/gsyn_login/main/1/userData.json
wget -O /root/my_rl_swarm_1/modal-login/temp-data/userApiKey.json https://raw.githubusercontent.com/pulagam344/gsyn_login/main/1/userApiKey.json
mkdir -p /root/my_rl_swarm_1/configs
wget -O /root/my_rl_swarm_1/configs/rg-swarm.yaml https://raw.githubusercontent.com/pulagam344/gsyn_connfig/main/rg-swarm.yaml
sed -i 's|3000|3001|' /root/my_rl_swarm_1/hivemind_exp/chain_utils.py
sed -i 's|REPLACE|3001|' /root/my_rl_swarm_1/run_rl_swarm.sh
sed -i 's|3000|3001|' /root/my_rl_swarm_1/rgym_exp/config/rg-swarm.yaml
sed -i 's|Qwen/Qwen3-0.6B|Gensyn/Qwen2.5-0.5B-Instruct|' /root/my_rl_swarm_1/run_rl_swarm.sh
sed -i 's|num_train_samples: 2|num_train_samples: 1|' /root/my_rl_swarm_1/configs/rg-swarm.yaml
sed -i 's|num_transplant_trees: 2|num_transplant_trees: 1|' /root/my_rl_swarm_1/configs/rg-swarm.yaml


# Part 2
git clone https://github.com/gensyn-ai/rl-swarm.git /root/my_rl_swarm_2
cd /root/my_rl_swarm_2
rm -f /root/my_rl_swarm_2/run_rl_swarm.sh && wget -O /root/my_rl_swarm_2/run_rl_swarm.sh https://raw.githubusercontent.com/pulagam344/gsyn_runsh/main/run_rl_swarm.sh && chmod +x run_rl_swarm.sh
wget -O /root/my_rl_swarm_2/modal-login/temp-data/userData.json https://raw.githubusercontent.com/pulagam344/gsyn_login/main/1/userData.json
wget -O /root/my_rl_swarm_2/modal-login/temp-data/userApiKey.json https://raw.githubusercontent.com/pulagam344/gsyn_login/main/1/userApiKey.json
mkdir -p /root/my_rl_swarm_2/configs
wget -O /root/my_rl_swarm_2/configs/rg-swarm.yaml https://raw.githubusercontent.com/pulagam344/gsyn_connfig/main/rg-swarm.yaml
sed -i 's|3000|3002|' /root/my_rl_swarm_2/hivemind_exp/chain_utils.py
sed -i 's|REPLACE|3002|' /root/my_rl_swarm_2/run_rl_swarm.sh
sed -i 's|3000|3002|' /root/my_rl_swarm_2/rgym_exp/config/rg-swarm.yaml
sed -i 's|Qwen/Qwen3-0.6B|Gensyn/Qwen2.5-0.5B-Instruct|' /root/my_rl_swarm_2/run_rl_swarm.sh
sed -i 's|num_train_samples: 2|num_train_samples: 1|' /root/my_rl_swarm_2/configs/rg-swarm.yaml
sed -i 's|num_transplant_trees: 2|num_transplant_trees: 1|' /root/my_rl_swarm_2/configs/rg-swarm.yaml

git config --global credential.helper store

# Function to run a swarm with logging
run_swarm() {
  local dir=$1
  local swarm_name=$2
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
    # Check swarm_1
    if [ ! -f "/root/running_3001.txt" ]; then
      echo "[$(date +%H:%M:%S)]-[monitor] Swarm_1 stopped, restarting..."
      run_swarm "/root/my_rl_swarm_1" "swarm_1" &
    fi

    # Check swarm_2
    if [ ! -f "/root/running_3002.txt" ]; then
      echo "[$(date +%H:%M:%S)]-[monitor] Swarm_2 stopped, restarting..."
      run_swarm "/root/my_rl_swarm_2" "swarm_2" &
    fi

    # Wait before next check (e.g., every 2 minutes)
    sleep 120
  done
}

# Start both swarms
run_swarm "/root/my_rl_swarm_1" "swarm_1" &
sleep 300
run_swarm "/root/my_rl_swarm_2" "swarm_2" &

# Start monitoring after 5 minutes
sleep 300
monitor_swarms &

# Wait for all background processes to complete
wait
