#!/bin/bash

DATA_PATH='./data/kubric_car_sfm/'
LOG_PATH='log/kubric_car_sfm/masked_pure_static/'

python train.py --base_folder $LOG_PATH --gin_bindings="data_dir='$DATA_PATH'" --gin_configs configs/separate/train.gin 

# python eval.py --base_folder $LOG_PATH --gin_bindings="data_dir='$DATA_PATH'" --gin_configs configs/separate/eval_decompose_dy.gin
# python eval.py --base_folder $LOG_PATH --gin_bindings="data_dir='$DATA_PATH'" --gin_configs configs/separate/eval_decompose_static.gin
# python eval.py --base_folder $LOG_PATH --gin_bindings="data_dir='$DATA_PATH'" --gin_configs configs/separate/eval_decompose_both.gin
# python eval.py --base_folder $LOG_PATH --gin_bindings="data_dir='$DATA_PATH'" --gin_configs configs/separate/eval_decompose_blendw.gin
# python eval.py --base_folder $LOG_PATH --gin_bindings="data_dir='$DATA_PATH'" --gin_configs configs/separate/eval_decompose_deformation.gin
# python eval.py --base_folder $LOG_PATH --gin_bindings="data_dir='$DATA_PATH'" --gin_configs configs/separate/eval_decompose_time.gin