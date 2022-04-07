#!/bin/bash

# sbatch command: 
# sbatch --export=application='./train_eval_decompose_cdw.sh' ./slurm_script/run_slurm_ampere.sh

DATA_PATH='./data/cdw/bungalows/'
LOG_PATH='log/cdw/bungalows/decompose_no_far_v4/'

echo "Log path is: $LOG_PATH"

python train.py --base_folder $LOG_PATH --gin_bindings="data_dir='$DATA_PATH'" --gin_configs configs/decompose/train_cdw.gin
python eval.py --base_folder $LOG_PATH --gin_bindings="data_dir='$DATA_PATH'" --gin_configs configs/decompose/train_cdw.gin

# python eval.py --base_folder $LOG_PATH --gin_bindings="data_dir='$DATA_PATH'" --gin_configs configs/decompose/eval_debug.gin

