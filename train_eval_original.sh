#!/bin/bash

DATA_PATH='./data/kubric_car_static_90/'
LOG_PATH='log/kubric_car_static_90/original_sfm/'

python train.py --base_folder $LOG_PATH --gin_bindings="data_dir='$DATA_PATH'" --gin_configs configs/test_local.gin

python eval.py --base_folder $LOG_PATH --gin_bindings="data_dir='$DATA_PATH'" --gin_configs configs/test_local.gin