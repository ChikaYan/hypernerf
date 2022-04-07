#!/bin/bash

# sbatch command: 
# sbatch --export=application='./train_eval_original.sh' ./slurm_script/run_slurm_ampere.sh

DATA_PATH='./data/kubric_multi_car_rand/'
LOG_PATH='log/kubric_multi_car_rand/original/'


echo "Log path is: $LOG_PATH"

python train.py --base_folder $LOG_PATH --gin_bindings="data_dir='$DATA_PATH'" --gin_configs configs/test_local_gt.gin

python eval.py --base_folder $LOG_PATH --gin_bindings="data_dir='$DATA_PATH'" --gin_configs configs/test_local_gt.gin