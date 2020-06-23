#!/bin/bash
#SBATCH --account=def-jinguo
#SBATCH --gres=gpu:v100l:1             # Number of GPUs (per node)
#SBATCH --mem=32G               # memory (per node)
#SBATCH --time=00-10:00            # time (DD-HH:MM)
#SBATCH --job-name=PR_SUMMARIZER_TEST
#SBATCH -o /home/vincenth/projects/def-jinguo/vincenth/PRSummarizer/output/retrain-%j.out

module load cuda/10.0.130
module load cuda cudnn

ulimit -c unlimited
start_time=$(date)
echo "Start Time: $start_time"
START_ITER=13000
python3 -m prsum.prsum train --param-path params_attn_pg_rl.json --model_path "models/train_1592858367/model/model_3000_1592858929.39499"
end_time=$(date)
echo "Start Time: $start_time"
echo "End Time: $end_time"
