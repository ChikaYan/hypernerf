#!/bin/bash

DATA_PATH='./data/kubric_car_sfm/'
LOG_PATH='log/kubric_car_sfm/decompose/'

python train.py --base_folder $LOG_PATH --gin_bindings="data_dir='$DATA_PATH'" --gin_configs configs/decompose/train.gin 

python eval.py --base_folder $LOG_PATH --gin_bindings="data_dir='$DATA_PATH'" --gin_configs configs/decompose/eval.gin
# python eval.py --base_folder $LOG_PATH --gin_bindings="data_dir='$DATA_PATH'" --gin_configs configs/decompose/eval_decompose_static.gin
# python eval.py --base_folder $LOG_PATH --gin_bindings="data_dir='$DATA_PATH'" --gin_configs configs/decompose/eval_decompose_static_full.gin
# python eval.py --base_folder $LOG_PATH --gin_bindings="data_dir='$DATA_PATH'" --gin_configs configs/decompose/eval_decompose_dy.gin
# python eval.py --base_folder $LOG_PATH --gin_bindings="data_dir='$DATA_PATH'" --gin_configs configs/decompose/eval_decompose_dy_full.gin
# python eval.py --base_folder $LOG_PATH --gin_bindings="data_dir='$DATA_PATH'" --gin_configs configs/decompose/eval_decompose_blendw.gin
# python eval.py --base_folder $LOG_PATH --gin_bindings="data_dir='$DATA_PATH'" --gin_configs configs/decompose/eval_decompose_both.gin
# python eval.py --base_folder $LOG_PATH --gin_bindings="data_dir='$DATA_PATH'" --gin_configs configs/decompose/eval_decompose_deformation.gin
# python eval.py --base_folder $LOG_PATH --gin_bindings="data_dir='$DATA_PATH'" --gin_configs configs/decompose/eval_decompose_time.gin