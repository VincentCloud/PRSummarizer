#!/bin/bash
#SBATCH --account=def-jinguo
#SBATCH --gres=gpu:v100l:1             # Number of GPUs (per node)
#SBATCH --mem=32G               # memory (per node)
#SBATCH --time=00-10:00            # time (DD-HH:MM)
#SBATCH --job-name=PR_SUMMARIZER_TEST
#SBATCH -o /home/vincenth/projects/def-jinguo/vincenth/PRSummarizer/output/select_model-%j.out

module load cuda/10.0.130
module load cuda cudnn

ulimit -c unlimited
start_time=$(date)
echo "Start Time: $start_time"
START_ITER=13000
python3 -m prsum.prsum select_model \
                       --param_path params_attn_pg.json \
                       --model_pattern "models/train_1592858367/model/model_{}_" \
                       --start_iter 1000 \
                       --end_iter 26000
end_time=$(date)
echo "Start Time: $start_time"
echo "End Time: $end_time"
