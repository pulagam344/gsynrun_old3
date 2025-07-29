#!/bin/bash
echo 2.4 version 

# apt-get install -y sudo
# sudo apt-get update

# curl -fsSL https://deb.nodesource.com/setup_22.x | sudo -E bash -
# sudo apt-get install -y nodejs
# node -v
# sudo npm install -g yarn
# yarn -v
# pip install git+https://github.com/huggingface/trl.git@main
# pip install wandb==0.15.12
# export HYDRA_FULL_ERROR=1

# pip install gensyn-genrl==0.1.4
# pip install reasoning-gym>=0.1.20 # for reasoning gym env
# pip install trl # for grpo config, will be deprecated soon
# pip install hivemind@git+https://github.com/gensyn-ai/hivemind@639c964a8019de63135a2594663b5bec8e5356dd # We need the latest, 1.1.11 is broken
# pip install --upgrade protobuf==6.31.0

# Part 1
git clone https://github.com/gensyn-ai/rl-swarm.git /home/gsynpeer/my_rl_swarm_1
cd /home/gsynpeer/my_rl_swarm_1
rm -f run_rl_swarm.sh && wget -O run_rl_swarm.sh https://raw.githubusercontent.com/pulagam344/gsyn_runsh/main/run_rl_swarm2.sh && chmod +x run_rl_swarm.sh
wget -O modal-login/temp-data/userData.json https://raw.githubusercontent.com/pulagam344/gsyn_login/main/3/userData.json
wget -O modal-login/temp-data/userApiKey.json https://raw.githubusercontent.com/pulagam344/gsyn_login/main/3/userApiKey.json
wget -O rgym_exp/config/rg-swarm.yaml https://raw.githubusercontent.com/pulagam344/gsyn_connfig/main/c-rg-swarm.yaml
sed -i 's|3000|3001|' hivemind_exp/chain_utils.py
sed -i 's|REPLACE|3001|' run_rl_swarm.sh
sed -i 's|3000|3001|' rgym_exp/config/rg-swarm.yaml

# Part 2
git clone https://github.com/gensyn-ai/rl-swarm.git /home/gsynpeer/my_rl_swarm_2
cd /home/gsynpeer/my_rl_swarm_2
rm -f run_rl_swarm.sh && wget -O run_rl_swarm.sh https://raw.githubusercontent.com/pulagam344/gsyn_runsh/main/run_rl_swarm2.sh && chmod +x run_rl_swarm.sh
wget -O modal-login/temp-data/userData.json https://raw.githubusercontent.com/pulagam344/gsyn_login/main/3/userData.json
wget -O modal-login/temp-data/userApiKey.json https://raw.githubusercontent.com/pulagam344/gsyn_login/main/3/userApiKey.json
wget -O rgym_exp/config/rg-swarm.yaml https://raw.githubusercontent.com/pulagam344/gsyn_connfig/main/c-rg-swarm.yaml
sed -i 's|3000|3002|' hivemind_exp/chain_utils.py
sed -i 's|REPLACE|3002|' run_rl_swarm.sh
sed -i 's|3000|3002|' rgym_exp/config/rg-swarm.yaml

# Part 3
git clone https://github.com/gensyn-ai/rl-swarm.git /home/gsynpeer/my_rl_swarm_3
cd /home/gsynpeer/my_rl_swarm_3
rm -f run_rl_swarm.sh && wget -O run_rl_swarm.sh https://raw.githubusercontent.com/pulagam344/gsyn_runsh/main/run_rl_swarm2.sh && chmod +x run_rl_swarm.sh
wget -O modal-login/temp-data/userData.json https://raw.githubusercontent.com/pulagam344/gsyn_login/main/3/userData.json
wget -O modal-login/temp-data/userApiKey.json https://raw.githubusercontent.com/pulagam344/gsyn_login/main/3/userApiKey.json
wget -O rgym_exp/config/rg-swarm.yaml https://raw.githubusercontent.com/pulagam344/gsyn_connfig/main/c-rg-swarm.yaml
sed -i 's|3000|3003|' hivemind_exp/chain_utils.py
sed -i 's|REPLACE|3003|' run_rl_swarm.sh
sed -i 's|3000|3003|' rgym_exp/config/rg-swarm.yaml


# Part 4
git clone https://github.com/gensyn-ai/rl-swarm.git /home/gsynpeer/my_rl_swarm_4
cd /home/gsynpeer/my_rl_swarm_4
rm -f run_rl_swarm.sh && wget -O run_rl_swarm.sh https://raw.githubusercontent.com/pulagam344/gsyn_runsh/main/run_rl_swarm2.sh && chmod +x run_rl_swarm.sh
wget -O modal-login/temp-data/userData.json https://raw.githubusercontent.com/pulagam344/gsyn_login/main/3/userData.json
wget -O modal-login/temp-data/userApiKey.json https://raw.githubusercontent.com/pulagam344/gsyn_login/main/3/userApiKey.json
wget -O rgym_exp/config/rg-swarm.yaml https://raw.githubusercontent.com/pulagam344/gsyn_connfig/main/c-rg-swarm.yaml
sed -i 's|3000|3004|' hivemind_exp/chain_utils.py
sed -i 's|REPLACE|3004|' run_rl_swarm.sh
sed -i 's|3000|3004|' rgym_exp/config/rg-swarm.yaml


# Part 5
git clone https://github.com/gensyn-ai/rl-swarm.git /home/gsynpeer/my_rl_swarm_5
cd /home/gsynpeer/my_rl_swarm_5
rm -f run_rl_swarm.sh && wget -O run_rl_swarm.sh https://raw.githubusercontent.com/pulagam344/gsyn_runsh/main/run_rl_swarm2.sh && chmod +x run_rl_swarm.sh
wget -O modal-login/temp-data/userData.json https://raw.githubusercontent.com/pulagam344/gsyn_login/main/3/userData.json
wget -O modal-login/temp-data/userApiKey.json https://raw.githubusercontent.com/pulagam344/gsyn_login/main/3/userApiKey.json
wget -O rgym_exp/config/rg-swarm.yaml https://raw.githubusercontent.com/pulagam344/gsyn_connfig/main/c-rg-swarm.yaml
sed -i 's|3000|3005|' hivemind_exp/chain_utils.py
sed -i 's|REPLACE|3005|' run_rl_swarm.sh
sed -i 's|3000|3005|' rgym_exp/config/rg-swarm.yaml


# Part 6
git clone https://github.com/gensyn-ai/rl-swarm.git /home/gsynpeer/my_rl_swarm_6
cd /home/gsynpeer/my_rl_swarm_6
rm -f run_rl_swarm.sh && wget -O run_rl_swarm.sh https://raw.githubusercontent.com/pulagam344/gsyn_runsh/main/run_rl_swarm2.sh && chmod +x run_rl_swarm.sh
wget -O modal-login/temp-data/userData.json https://raw.githubusercontent.com/pulagam344/gsyn_login/main/3/userData.json
wget -O modal-login/temp-data/userApiKey.json https://raw.githubusercontent.com/pulagam344/gsyn_login/main/3/userApiKey.json
wget -O rgym_exp/config/rg-swarm.yaml https://raw.githubusercontent.com/pulagam344/gsyn_connfig/main/c-rg-swarm.yaml
sed -i 's|3000|3006|' hivemind_exp/chain_utils.py
sed -i 's|REPLACE|3006|' run_rl_swarm.sh
sed -i 's|3000|3006|' rgym_exp/config/rg-swarm.yaml

# Part 7
git clone https://github.com/gensyn-ai/rl-swarm.git /home/gsynpeer/my_rl_swarm_7
cd /home/gsynpeer/my_rl_swarm_7
rm -f run_rl_swarm.sh && wget -O run_rl_swarm.sh https://raw.githubusercontent.com/pulagam344/gsyn_runsh/main/run_rl_swarm2.sh && chmod +x run_rl_swarm.sh
wget -O modal-login/temp-data/userData.json https://raw.githubusercontent.com/pulagam344/gsyn_login/main/3/userData.json
wget -O modal-login/temp-data/userApiKey.json https://raw.githubusercontent.com/pulagam344/gsyn_login/main/3/userApiKey.json
wget -O rgym_exp/config/rg-swarm.yaml https://raw.githubusercontent.com/pulagam344/gsyn_connfig/main/c-rg-swarm.yaml
sed -i 's|3000|3007|' hivemind_exp/chain_utils.py
sed -i 's|REPLACE|3007|' run_rl_swarm.sh
sed -i 's|3000|3007|' rgym_exp/config/rg-swarm.yaml


# Part 8
git clone https://github.com/gensyn-ai/rl-swarm.git /home/gsynpeer/my_rl_swarm_8
cd /home/gsynpeer/my_rl_swarm_8
rm -f run_rl_swarm.sh && wget -O run_rl_swarm.sh https://raw.githubusercontent.com/pulagam344/gsyn_runsh/main/run_rl_swarm2.sh && chmod +x run_rl_swarm.sh
wget -O modal-login/temp-data/userData.json https://raw.githubusercontent.com/pulagam344/gsyn_login/main/3/userData.json
wget -O modal-login/temp-data/userApiKey.json https://raw.githubusercontent.com/pulagam344/gsyn_login/main/3/userApiKey.json
wget -O rgym_exp/config/rg-swarm.yaml https://raw.githubusercontent.com/pulagam344/gsyn_connfig/main/c-rg-swarm.yaml
sed -i 's|3000|3008|' hivemind_exp/chain_utils.py
sed -i 's|REPLACE|3008|' run_rl_swarm.sh
sed -i 's|3000|3008|' rgym_exp/config/rg-swarm.yaml

# Part 9
git clone https://github.com/gensyn-ai/rl-swarm.git /home/gsynpeer/my_rl_swarm_9
cd /home/gsynpeer/my_rl_swarm_9
rm -f run_rl_swarm.sh && wget -O run_rl_swarm.sh https://raw.githubusercontent.com/pulagam344/gsyn_runsh/main/run_rl_swarm2.sh && chmod +x run_rl_swarm.sh
wget -O modal-login/temp-data/userData.json https://raw.githubusercontent.com/pulagam344/gsyn_login/main/3/userData.json
wget -O modal-login/temp-data/userApiKey.json https://raw.githubusercontent.com/pulagam344/gsyn_login/main/3/userApiKey.json
wget -O rgym_exp/config/rg-swarm.yaml https://raw.githubusercontent.com/pulagam344/gsyn_connfig/main/c-rg-swarm.yaml
sed -i 's|3000|3009|' hivemind_exp/chain_utils.py
sed -i 's|REPLACE|3009|' run_rl_swarm.sh
sed -i 's|3000|3009|' rgym_exp/config/rg-swarm.yaml

# Part 10
git clone https://github.com/gensyn-ai/rl-swarm.git /home/gsynpeer/my_rl_swarm_10
cd /home/gsynpeer/my_rl_swarm_10
rm -f run_rl_swarm.sh && wget -O run_rl_swarm.sh https://raw.githubusercontent.com/pulagam344/gsyn_runsh/main/run_rl_swarm2.sh && chmod +x run_rl_swarm.sh
wget -O modal-login/temp-data/userData.json https://raw.githubusercontent.com/pulagam344/gsyn_login/main/3/userData.json
wget -O modal-login/temp-data/userApiKey.json https://raw.githubusercontent.com/pulagam344/gsyn_login/main/3/userApiKey.json
wget -O rgym_exp/config/rg-swarm.yaml https://raw.githubusercontent.com/pulagam344/gsyn_connfig/main/c-rg-swarm.yaml
sed -i 's|3000|3010|' hivemind_exp/chain_utils.py
sed -i 's|REPLACE|3010|' run_rl_swarm.sh
sed -i 's|3000|3010|' rgym_exp/config/rg-swarm.yaml

git config --global credential.helper store

Function to run a swarm with logging
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
    if [ ! -f "/home/gsynpeer/running_3001.txt" ]; then
      echo "[$(date +%H:%M:%S)]-[monitor] Swarm_1 stopped, restarting..."
      run_swarm "/home/gsynpeer/my_rl_swarm_1" "swarm_1" &
    fi

    # Check swarm_2
    if [ ! -f "/home/gsynpeer/running_3002.txt" ]; then
      echo "[$(date +%H:%M:%S)]-[monitor] Swarm_2 stopped, restarting..."
      run_swarm "/home/gsynpeer/my_rl_swarm_2" "swarm_2" &
    fi

    # Check swarm_3
    if [ ! -f "/home/gsynpeer/running_3003.txt" ]; then
      echo "[$(date +%H:%M:%S)]-[monitor] Swarm_3 stopped, restarting..."
      run_swarm "/home/gsynpeer/my_rl_swarm_3" "swarm_3" &
    fi

    # Check swarm_4
    if [ ! -f "/home/gsynpeer/running_3004.txt" ]; then
      echo "[$(date +%H:%M:%S)]-[monitor] Swarm_4 stopped, restarting..."
      run_swarm "/home/gsynpeer/my_rl_swarm_4" "swarm_4" &
    fi

    # Check swarm_5
    if [ ! -f "/home/gsynpeer/running_3005.txt" ]; then
      echo "[$(date +%H:%M:%S)]-[monitor] Swarm_5 stopped, restarting..."
      run_swarm "/home/gsynpeer/my_rl_swarm_5" "swarm_5" &
    fi

    # Check swarm_6
    if [ ! -f "/home/gsynpeer/running_3006.txt" ]; then
      echo "[$(date +%H:%M:%S)]-[monitor] Swarm_6 stopped, restarting..."
      run_swarm "/home/gsynpeer/my_rl_swarm_6" "swarm_6" &
    fi

    # Check swarm_7
    if [ ! -f "/home/gsynpeer/running_3007.txt" ]; then
      echo "[$(date +%H:%M:%S)]-[monitor] Swarm_7 stopped, restarting..."
      run_swarm "/home/gsynpeer/my_rl_swarm_7" "swarm_7" &
    fi

    # Check swarm_8
    if [ ! -f "/home/gsynpeer/running_3008.txt" ]; then
      echo "[$(date +%H:%M:%S)]-[monitor] Swarm_8 stopped, restarting..."
      run_swarm "/home/gsynpeer/my_rl_swarm_8" "swarm_8" &
    fi

    # Check swarm_9
    if [ ! -f "/home/gsynpeer/running_3009.txt" ]; then
      echo "[$(date +%H:%M:%S)]-[monitor] Swarm_9 stopped, restarting..."
      run_swarm "/home/gsynpeer/my_rl_swarm_9" "swarm_9" &
    fi

    # Check swarm_10
    if [ ! -f "/home/gsynpeer/running_3010.txt" ]; then
      echo "[$(date +%H:%M:%S)]-[monitor] Swarm_10 stopped, restarting..."
      run_swarm "/home/gsynpeer/my_rl_swarm_10" "swarm_10" &
    fi

    # Wait before next check (e.g., every 2 minutes)
    sleep 5
  done
}

# Start both swarms
run_swarm "/home/gsynpeer/my_rl_swarm_1" "swarm_1" &
sleep 3
run_swarm "/home/gsynpeer/my_rl_swarm_2" "swarm_2" &
sleep 3
run_swarm "/home/gsynpeer/my_rl_swarm_3" "swarm_3" &
sleep 3
run_swarm "/home/gsynpeer/my_rl_swarm_4" "swarm_4" &
sleep 3
run_swarm "/home/gsynpeer/my_rl_swarm_5" "swarm_5" &
sleep 3
run_swarm "/home/gsynpeer/my_rl_swarm_6" "swarm_6" &
sleep 3
run_swarm "/home/gsynpeer/my_rl_swarm_7" "swarm_7" &
sleep 3
run_swarm "/home/gsynpeer/my_rl_swarm_8" "swarm_8" &
sleep 3
run_swarm "/home/gsynpeer/my_rl_swarm_9" "swarm_9" &
sleep 3
run_swarm "/home/gsynpeer/my_rl_swarm_10" "swarm_10" &
sleep 3

# Start monitoring after 5 minutes
monitor_swarms &
# Wait for all background processes to complete
wait
