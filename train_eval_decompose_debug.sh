#!/bin/bash

# sbatch command: 
# sbatch --export=application='./train_eval_decompose_debug.sh' ./slurm_script/run_slurm_ampere.sh

DATA_PATH='./data/peopleInShade/'
LOG_PATH='log/peopleInShade/decompose_no_far/'

echo "Log path is: $LOG_PATH"

python train.py --base_folder $LOG_PATH --gin_bindings="data_dir='$DATA_PATH'" --gin_configs configs/decompose/train_debug.gin
python eval.py --base_folder $LOG_PATH --gin_bindings="data_dir='$DATA_PATH'" --gin_configs configs/decompose/train_debug.gin

# python eval.py --base_folder $LOG_PATH --gin_bindings="data_dir='$DATA_PATH'" --gin_configs configs/decompose/eval_debug.gin

