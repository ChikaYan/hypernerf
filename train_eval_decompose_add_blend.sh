#!/bin/bash

# sbatch command: 
# sbatch --export=application='./train_eval_decompose_add_blend.sh' ./slurm_script/run_slurm_ampere.sh

DATA_PATH='./data/davis/swing/'
LOG_PATH='log/davis/swing/huge_loss_v5/'
# DATA_PATH='./data/my_hand_large_motion/'
# LOG_PATH='log/my_hand_large_motion/shadow_model/init_ana/mid_shadow_loss_v2/'

echo "Log path is: $LOG_PATH"

python train.py --base_folder $LOG_PATH --gin_bindings="data_dir='$DATA_PATH'" --gin_configs configs/decompose/train_add_blend.gin
python eval.py --base_folder $LOG_PATH --gin_bindings="data_dir='$DATA_PATH'" --gin_configs configs/decompose/train_add_blend.gin

