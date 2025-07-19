#!/bin/bash
echo 1.3 version 
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
sudo apt install python3-pip

pip install gensyn-genrl==0.1.4
pip install reasoning-gym>=0.1.20 # for reasoning gym env
pip install trl # for grpo config, will be deprecated soon
pip install hivemind@git+https://github.com/gensyn-ai/hivemind@639c964a8019de63135a2594663b5bec8e5356dd # We need the latest, 1.1.11 is broken
#pip install --upgrade protobuf==6.31.0

# Part 1
git clone https://github.com/gensyn-ai/rl-swarm.git /root/my_rl_swarm_1
cd /root/my_rl_swarm_1
rm -f /root/my_rl_swarm_1/run_rl_swarm.sh && wget -O /root/my_rl_swarm_1/run_rl_swarm.sh https://raw.githubusercontent.com/pulagam344/gsyn_runsh/main/run_rl_swarm2.sh && chmod +x run_rl_swarm.sh
wget -O /root/my_rl_swarm_1/modal-login/temp-data/userData.json https://raw.githubusercontent.com/pulagam344/gsyn_login/main/1/userData.json
wget -O /root/my_rl_swarm_1/modal-login/temp-data/userApiKey.json https://raw.githubusercontent.com/pulagam344/gsyn_login/main/1/userApiKey.json
mkdir -p /root/my_rl_swarm_1/configs
sed -i 's|Qwen/Qwen3-0.6B|Gensyn/Qwen2.5-0.5B-Instruct|' /root/my_rl_swarm_1/run_rl_swarm.sh
sed -i 's|3000|3001|' /root/my_rl_swarm_1/hivemind_exp/chain_utils.py
sed -i 's|REPLACE|3001|' /root/my_rl_swarm_1/run_rl_swarm.sh
sed -i 's|3000|3001|' /root/my_rl_swarm_1/rgym_exp/config/rg-swarm.yaml
sed -i 's|num_train_samples: 2|num_train_samples: 1|' /root/my_rl_swarm_1/rgym_exp/config/rg-swarm.yaml
sed -i 's|num_transplant_trees: 2|num_transplant_trees: 1|' /root/my_rl_swarm_1/rgym_exp/config/rg-swarm.yaml
sed -i 's|hf_push_frequency: 1|hf_push_frequency: 10|' /root/my_rl_swarm_1/rgym_exp/config/rg-swarm.yaml

# Part 2
git clone https://github.com/gensyn-ai/rl-swarm.git /root/my_rl_swarm_2
cd /root/my_rl_swarm_2
rm -f /root/my_rl_swarm_2/run_rl_swarm.sh && wget -O /root/my_rl_swarm_2/run_rl_swarm.sh https://raw.githubusercontent.com/pulagam344/gsyn_runsh/main/run_rl_swarm2.sh && chmod +x run_rl_swarm.sh
wget -O /root/my_rl_swarm_2/modal-login/temp-data/userData.json https://raw.githubusercontent.com/pulagam344/gsyn_login/main/1/userData.json
wget -O /root/my_rl_swarm_2/modal-login/temp-data/userApiKey.json https://raw.githubusercontent.com/pulagam344/gsyn_login/main/1/userApiKey.json
mkdir -p /root/my_rl_swarm_2/configs
sed -i 's|Qwen/Qwen3-0.6B|Gensyn/Qwen2.5-0.5B-Instruct|' /root/my_rl_swarm_2/run_rl_swarm.sh
sed -i 's|3000|3002|' /root/my_rl_swarm_2/hivemind_exp/chain_utils.py
sed -i 's|REPLACE|3002|' /root/my_rl_swarm_2/run_rl_swarm.sh
sed -i 's|3000|3002|' /root/my_rl_swarm_2/rgym_exp/config/rg-swarm.yaml
sed -i 's|num_train_samples: 2|num_train_samples: 1|' /root/my_rl_swarm_2/rgym_exp/config/rg-swarm.yaml
sed -i 's|num_transplant_trees: 2|num_transplant_trees: 1|' /root/my_rl_swarm_2/rgym_exp/config/rg-swarm.yaml
sed -i 's|hf_push_frequency: 1|hf_push_frequency: 10|' /root/my_rl_swarm_2/rgym_exp/config/rg-swarm.yaml

# Part 3
git clone https://github.com/gensyn-ai/rl-swarm.git /root/my_rl_swarm_3
cd /root/my_rl_swarm_3
rm -f /root/my_rl_swarm_3/run_rl_swarm.sh && wget -O /root/my_rl_swarm_3/run_rl_swarm.sh https://raw.githubusercontent.com/pulagam344/gsyn_runsh/main/run_rl_swarm2.sh && chmod +x run_rl_swarm.sh
wget -O /root/my_rl_swarm_3/modal-login/temp-data/userData.json https://raw.githubusercontent.com/pulagam344/gsyn_login/main/1/userData.json
wget -O /root/my_rl_swarm_3/modal-login/temp-data/userApiKey.json https://raw.githubusercontent.com/pulagam344/gsyn_login/main/1/userApiKey.json
mkdir -p /root/my_rl_swarm_3/configs
sed -i 's|Qwen/Qwen3-0.6B|Gensyn/Qwen2.5-0.5B-Instruct|' /root/my_rl_swarm_3/run_rl_swarm.sh
sed -i 's|3000|3003|' /root/my_rl_swarm_3/hivemind_exp/chain_utils.py
sed -i 's|REPLACE|3003|' /root/my_rl_swarm_3/run_rl_swarm.sh
sed -i 's|3000|3003|' /root/my_rl_swarm_3/rgym_exp/config/rg-swarm.yaml
sed -i 's|num_train_samples: 2|num_train_samples: 1|' /root/my_rl_swarm_3/rgym_exp/config/rg-swarm.yaml
sed -i 's|num_transplant_trees: 2|num_transplant_trees: 1|' /root/my_rl_swarm_3/rgym_exp/config/rg-swarm.yaml
sed -i 's|hf_push_frequency: 1|hf_push_frequency: 10|' /root/my_rl_swarm_3/rgym_exp/config/rg-swarm.yaml


# Part 4
git clone https://github.com/gensyn-ai/rl-swarm.git /root/my_rl_swarm_4
cd /root/my_rl_swarm_4
rm -f /root/my_rl_swarm_4/run_rl_swarm.sh && wget -O /root/my_rl_swarm_4/run_rl_swarm.sh https://raw.githubusercontent.com/pulagam344/gsyn_runsh/main/run_rl_swarm2.sh && chmod +x run_rl_swarm.sh
wget -O /root/my_rl_swarm_4/modal-login/temp-data/userData.json https://raw.githubusercontent.com/pulagam344/gsyn_login/main/1/userData.json
wget -O /root/my_rl_swarm_4/modal-login/temp-data/userApiKey.json https://raw.githubusercontent.com/pulagam344/gsyn_login/main/1/userApiKey.json
mkdir -p /root/my_rl_swarm_4/configs
sed -i 's|Qwen/Qwen3-0.6B|Gensyn/Qwen2.5-0.5B-Instruct|' /root/my_rl_swarm_4/run_rl_swarm.sh
sed -i 's|3000|3004|' /root/my_rl_swarm_4/hivemind_exp/chain_utils.py
sed -i 's|REPLACE|3004|' /root/my_rl_swarm_4/run_rl_swarm.sh
sed -i 's|3000|3004|' /root/my_rl_swarm_4/rgym_exp/config/rg-swarm.yaml
sed -i 's|num_train_samples: 2|num_train_samples: 1|' /root/my_rl_swarm_4/rgym_exp/config/rg-swarm.yaml
sed -i 's|num_transplant_trees: 2|num_transplant_trees: 1|' /root/my_rl_swarm_4/rgym_exp/config/rg-swarm.yaml
sed -i 's|hf_push_frequency: 1|hf_push_frequency: 10|' /root/my_rl_swarm_4/rgym_exp/config/rg-swarm.yaml


# Part 5
git clone https://github.com/gensyn-ai/rl-swarm.git /root/my_rl_swarm_5
cd /root/my_rl_swarm_5
rm -f /root/my_rl_swarm_5/run_rl_swarm.sh && wget -O /root/my_rl_swarm_5/run_rl_swarm.sh https://raw.githubusercontent.com/pulagam344/gsyn_runsh/main/run_rl_swarm2.sh && chmod +x run_rl_swarm.sh
wget -O /root/my_rl_swarm_5/modal-login/temp-data/userData.json https://raw.githubusercontent.com/pulagam344/gsyn_login/main/1/userData.json
wget -O /root/my_rl_swarm_5/modal-login/temp-data/userApiKey.json https://raw.githubusercontent.com/pulagam344/gsyn_login/main/1/userApiKey.json
mkdir -p /root/my_rl_swarm_5/configs
sed -i 's|Qwen/Qwen3-0.6B|Gensyn/Qwen2.5-0.5B-Instruct|' /root/my_rl_swarm_5/run_rl_swarm.sh
sed -i 's|3000|3005|' /root/my_rl_swarm_5/hivemind_exp/chain_utils.py
sed -i 's|REPLACE|3005|' /root/my_rl_swarm_5/run_rl_swarm.sh
sed -i 's|3000|3005|' /root/my_rl_swarm_5/rgym_exp/config/rg-swarm.yaml
sed -i 's|num_train_samples: 2|num_train_samples: 1|' /root/my_rl_swarm_5/rgym_exp/config/rg-swarm.yaml
sed -i 's|num_transplant_trees: 2|num_transplant_trees: 1|' /root/my_rl_swarm_5/rgym_exp/config/rg-swarm.yaml
sed -i 's|hf_push_frequency: 1|hf_push_frequency: 10|' /root/my_rl_swarm_5/rgym_exp/config/rg-swarm.yaml


# Part 6
git clone https://github.com/gensyn-ai/rl-swarm.git /root/my_rl_swarm_6
cd /root/my_rl_swarm_6
rm -f /root/my_rl_swarm_6/run_rl_swarm.sh && wget -O /root/my_rl_swarm_6/run_rl_swarm.sh https://raw.githubusercontent.com/pulagam344/gsyn_runsh/main/run_rl_swarm2.sh && chmod +x run_rl_swarm.sh
wget -O /root/my_rl_swarm_6/modal-login/temp-data/userData.json https://raw.githubusercontent.com/pulagam344/gsyn_login/main/1/userData.json
wget -O /root/my_rl_swarm_6/modal-login/temp-data/userApiKey.json https://raw.githubusercontent.com/pulagam344/gsyn_login/main/1/userApiKey.json
mkdir -p /root/my_rl_swarm_6/configs
sed -i 's|Qwen/Qwen3-0.6B|Gensyn/Qwen2.5-0.5B-Instruct|' /root/my_rl_swarm_6/run_rl_swarm.sh
sed -i 's|3000|3006|' /root/my_rl_swarm_6/hivemind_exp/chain_utils.py
sed -i 's|REPLACE|3006|' /root/my_rl_swarm_6/run_rl_swarm.sh
sed -i 's|3000|3006|' /root/my_rl_swarm_6/rgym_exp/config/rg-swarm.yaml
sed -i 's|num_train_samples: 2|num_train_samples: 1|' /root/my_rl_swarm_6/rgym_exp/config/rg-swarm.yaml
sed -i 's|num_transplant_trees: 2|num_transplant_trees: 1|' /root/my_rl_swarm_6/rgym_exp/config/rg-swarm.yaml
sed -i 's|hf_push_frequency: 1|hf_push_frequency: 10|' /root/my_rl_swarm_6/rgym_exp/config/rg-swarm.yaml

# Part 7
git clone https://github.com/gensyn-ai/rl-swarm.git /root/my_rl_swarm_7
cd /root/my_rl_swarm_7
rm -f /root/my_rl_swarm_7/run_rl_swarm.sh && wget -O /root/my_rl_swarm_7/run_rl_swarm.sh https://raw.githubusercontent.com/pulagam344/gsyn_runsh/main/run_rl_swarm2.sh && chmod +x run_rl_swarm.sh
wget -O /root/my_rl_swarm_7/modal-login/temp-data/userData.json https://raw.githubusercontent.com/pulagam344/gsyn_login/main/1/userData.json
wget -O /root/my_rl_swarm_7/modal-login/temp-data/userApiKey.json https://raw.githubusercontent.com/pulagam344/gsyn_login/main/1/userApiKey.json
mkdir -p /root/my_rl_swarm_7/configs
sed -i 's|Qwen/Qwen3-0.6B|Gensyn/Qwen2.5-0.5B-Instruct|' /root/my_rl_swarm_7/run_rl_swarm.sh
sed -i 's|3000|3007|' /root/my_rl_swarm_7/hivemind_exp/chain_utils.py
sed -i 's|REPLACE|3007|' /root/my_rl_swarm_7/run_rl_swarm.sh
sed -i 's|3000|3007|' /root/my_rl_swarm_7/rgym_exp/config/rg-swarm.yaml
sed -i 's|num_train_samples: 2|num_train_samples: 1|' /root/my_rl_swarm_7/rgym_exp/config/rg-swarm.yaml
sed -i 's|num_transplant_trees: 2|num_transplant_trees: 1|' /root/my_rl_swarm_7/rgym_exp/config/rg-swarm.yaml
sed -i 's|hf_push_frequency: 1|hf_push_frequency: 10|' /root/my_rl_swarm_7/rgym_exp/config/rg-swarm.yaml


# Part 8
git clone https://github.com/gensyn-ai/rl-swarm.git /root/my_rl_swarm_8
cd /root/my_rl_swarm_8
rm -f /root/my_rl_swarm_8/run_rl_swarm.sh && wget -O /root/my_rl_swarm_8/run_rl_swarm.sh https://raw.githubusercontent.com/pulagam344/gsyn_runsh/main/run_rl_swarm2.sh && chmod +x run_rl_swarm.sh
wget -O /root/my_rl_swarm_8/modal-login/temp-data/userData.json https://raw.githubusercontent.com/pulagam344/gsyn_login/main/1/userData.json
wget -O /root/my_rl_swarm_8/modal-login/temp-data/userApiKey.json https://raw.githubusercontent.com/pulagam344/gsyn_login/main/1/userApiKey.json
mkdir -p /root/my_rl_swarm_8/configs
sed -i 's|Qwen/Qwen3-0.6B|Gensyn/Qwen2.5-0.5B-Instruct|' /root/my_rl_swarm_8/run_rl_swarm.sh
sed -i 's|3000|3008|' /root/my_rl_swarm_8/hivemind_exp/chain_utils.py
sed -i 's|REPLACE|3008|' /root/my_rl_swarm_8/run_rl_swarm.sh
sed -i 's|3000|3008|' /root/my_rl_swarm_8/rgym_exp/config/rg-swarm.yaml
sed -i 's|num_train_samples: 2|num_train_samples: 1|' /root/my_rl_swarm_8/rgym_exp/config/rg-swarm.yaml
sed -i 's|num_transplant_trees: 2|num_transplant_trees: 1|' /root/my_rl_swarm_8/rgym_exp/config/rg-swarm.yaml
sed -i 's|hf_push_frequency: 1|hf_push_frequency: 10|' /root/my_rl_swarm_8/rgym_exp/config/rg-swarm.yaml

# Part 9
git clone https://github.com/gensyn-ai/rl-swarm.git /root/my_rl_swarm_9
cd /root/my_rl_swarm_9
rm -f /root/my_rl_swarm_9/run_rl_swarm.sh && wget -O /root/my_rl_swarm_9/run_rl_swarm.sh https://raw.githubusercontent.com/pulagam344/gsyn_runsh/main/run_rl_swarm2.sh && chmod +x run_rl_swarm.sh
wget -O /root/my_rl_swarm_9/modal-login/temp-data/userData.json https://raw.githubusercontent.com/pulagam344/gsyn_login/main/1/userData.json
wget -O /root/my_rl_swarm_9/modal-login/temp-data/userApiKey.json https://raw.githubusercontent.com/pulagam344/gsyn_login/main/1/userApiKey.json
mkdir -p /root/my_rl_swarm_9/configs
sed -i 's|Qwen/Qwen3-0.6B|Gensyn/Qwen2.5-0.5B-Instruct|' /root/my_rl_swarm_9/run_rl_swarm.sh
sed -i 's|3000|3009|' /root/my_rl_swarm_9/hivemind_exp/chain_utils.py
sed -i 's|REPLACE|3009|' /root/my_rl_swarm_9/run_rl_swarm.sh
sed -i 's|3000|3009|' /root/my_rl_swarm_9/rgym_exp/config/rg-swarm.yaml
sed -i 's|num_train_samples: 2|num_train_samples: 1|' /root/my_rl_swarm_9/rgym_exp/config/rg-swarm.yaml
sed -i 's|num_transplant_trees: 2|num_transplant_trees: 1|' /root/my_rl_swarm_9/rgym_exp/config/rg-swarm.yaml
sed -i 's|hf_push_frequency: 1|hf_push_frequency: 10|' /root/my_rl_swarm_9/rgym_exp/config/rg-swarm.yaml

# Part 10
git clone https://github.com/gensyn-ai/rl-swarm.git /root/my_rl_swarm_10
cd /root/my_rl_swarm_10
rm -f /root/my_rl_swarm_10/run_rl_swarm.sh && wget -O /root/my_rl_swarm_10/run_rl_swarm.sh https://raw.githubusercontent.com/pulagam344/gsyn_runsh/main/run_rl_swarm2.sh && chmod +x run_rl_swarm.sh
wget -O /root/my_rl_swarm_10/modal-login/temp-data/userData.json https://raw.githubusercontent.com/pulagam344/gsyn_login/main/1/userData.json
wget -O /root/my_rl_swarm_10/modal-login/temp-data/userApiKey.json https://raw.githubusercontent.com/pulagam344/gsyn_login/main/1/userApiKey.json
mkdir -p /root/my_rl_swarm_10/configs
sed -i 's|Qwen/Qwen3-0.6B|Gensyn/Qwen2.5-0.5B-Instruct|' /root/my_rl_swarm_10/run_rl_swarm.sh
sed -i 's|3000|3010|' /root/my_rl_swarm_10/hivemind_exp/chain_utils.py
sed -i 's|REPLACE|3010|' /root/my_rl_swarm_10/run_rl_swarm.sh
sed -i 's|3000|3010|' /root/my_rl_swarm_10/rgym_exp/config/rg-swarm.yaml
sed -i 's|num_train_samples: 2|num_train_samples: 1|' /root/my_rl_swarm_10/rgym_exp/config/rg-swarm.yaml
sed -i 's|num_transplant_trees: 2|num_transplant_trees: 1|' /root/my_rl_swarm_10/rgym_exp/config/rg-swarm.yaml
sed -i 's|hf_push_frequency: 1|hf_push_frequency: 10|' /root/my_rl_swarm_10/rgym_exp/config/rg-swarm.yaml

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
    if [ ! -f "/root/running_3001.txt" ]; then
      echo "[$(date +%H:%M:%S)]-[monitor] Swarm_1 stopped, restarting..."
      run_swarm "/root/my_rl_swarm_1" "swarm_1" &
    fi

    # Check swarm_2
    if [ ! -f "/root/running_3002.txt" ]; then
      echo "[$(date +%H:%M:%S)]-[monitor] Swarm_2 stopped, restarting..."
      run_swarm "/root/my_rl_swarm_2" "swarm_2" &
    fi

    # Check swarm_3
    if [ ! -f "/root/running_3003.txt" ]; then
      echo "[$(date +%H:%M:%S)]-[monitor] Swarm_3 stopped, restarting..."
      run_swarm "/root/my_rl_swarm_3" "swarm_3" &
    fi

    # Check swarm_4
    if [ ! -f "/root/running_3004.txt" ]; then
      echo "[$(date +%H:%M:%S)]-[monitor] Swarm_4 stopped, restarting..."
      run_swarm "/root/my_rl_swarm_4" "swarm_4" &
    fi

    # Check swarm_5
    if [ ! -f "/root/running_3005.txt" ]; then
      echo "[$(date +%H:%M:%S)]-[monitor] Swarm_5 stopped, restarting..."
      run_swarm "/root/my_rl_swarm_5" "swarm_5" &
    fi

    # Check swarm_6
    if [ ! -f "/root/running_3006.txt" ]; then
      echo "[$(date +%H:%M:%S)]-[monitor] Swarm_6 stopped, restarting..."
      run_swarm "/root/my_rl_swarm_6" "swarm_6" &
    fi

    # Check swarm_7
    if [ ! -f "/root/running_3007.txt" ]; then
      echo "[$(date +%H:%M:%S)]-[monitor] Swarm_7 stopped, restarting..."
      run_swarm "/root/my_rl_swarm_7" "swarm_7" &
    fi

    # Check swarm_8
    if [ ! -f "/root/running_3008.txt" ]; then
      echo "[$(date +%H:%M:%S)]-[monitor] Swarm_8 stopped, restarting..."
      run_swarm "/root/my_rl_swarm_8" "swarm_8" &
    fi

    # Check swarm_9
    if [ ! -f "/root/running_3009.txt" ]; then
      echo "[$(date +%H:%M:%S)]-[monitor] Swarm_9 stopped, restarting..."
      run_swarm "/root/my_rl_swarm_9" "swarm_9" &
    fi

    # Check swarm_10
    if [ ! -f "/root/running_3010.txt" ]; then
      echo "[$(date +%H:%M:%S)]-[monitor] Swarm_10 stopped, restarting..."
      run_swarm "/root/my_rl_swarm_10" "swarm_10" &
    fi

    # Wait before next check (e.g., every 2 minutes)
    sleep 120
  done
}

# Start both swarms
run_swarm "/root/my_rl_swarm_1" "swarm_1" &
sleep 10
run_swarm "/root/my_rl_swarm_2" "swarm_2" &
sleep 10
run_swarm "/root/my_rl_swarm_3" "swarm_3" &
sleep 10
run_swarm "/root/my_rl_swarm_4" "swarm_4" &
sleep 10
run_swarm "/root/my_rl_swarm_5" "swarm_5" &
sleep 10
run_swarm "/root/my_rl_swarm_6" "swarm_6" &
sleep 10
run_swarm "/root/my_rl_swarm_7" "swarm_7" &
sleep 10
run_swarm "/root/my_rl_swarm_8" "swarm_8" &
sleep 10
run_swarm "/root/my_rl_swarm_9" "swarm_9" &
sleep 10
run_swarm "/root/my_rl_swarm_10" "swarm_10" &
# Start monitoring after 5 minutes
sleep 300
monitor_swarms &

# Wait for all background processes to complete
wait
