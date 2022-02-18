#!/bin/bash

# sbatch command: 
# sbatch --export=application='./train_eval_decompose.sh' ./slurm_script/run_slurm.sh

DATA_PATH='./data/my_hand_large_motion/'
LOG_PATH='log/my_hand_large_motion/decompose_v6_init_new_reg/'


echo "Log path is: $LOG_PATH"

python train.py --base_folder $LOG_PATH --gin_bindings="data_dir='$DATA_PATH'" --gin_configs configs/decompose/train.gin 

# python eval.py --base_folder $LOG_PATH --gin_bindings="data_dir='$DATA_PATH'" --gin_configs configs/decompose/eval.gin
