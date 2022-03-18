import itertools
from pathlib import Path

SOURCE_CONFIG = './configs/decompose/train_kubric_template.gin'
ROOT_DIR = Path('./configs/decompose/tune/varying_blendw_loss_w_s5/')

ROOT_DIR.mkdir(parents=True, exist_ok=True)
params = []
values = []

# quick experiment or full run
QUICK = False

params.append("TrainConfig.blendw_loss_weight_schedule = {{ \n \
  'type': 'exp_increase', \n \
  'initial_value': {}, \n \
  'final_value': 0.1, \n \
  'num_steps': 75000, \n \
}}")
values.append([0.00001, 0.0001, 0.001, 0.01, 0.1, 0.005])

# params.append("TrainConfig.shadow_r_loss_weight = {{ \n \
#   'type': 'linear', \n \
#   'initial_value': {}, \n \
#   'final_value': {}, \n \
#   'num_steps': 100000, \n \
# }}")
# values.append([[0.05, 0.1], [0.05, 0.01]])

params.append("TrainConfig.blendw_loss_skewness = {}\n")
values.append([5.0])
# values.append([0.5, 1.0, 1.5, 2.0, 5.0, 10.0, 1.25, 1.24])

params.append("max_steps = {}\n")
values.append([20000 if QUICK else 100000])

params.append("EvalConfig.niter_runtime_eval = {}\n")
values.append([2000 if QUICK else 25000])

params.append("TrainConfig.blendw_area_loss_weight = {}\n")
# values.append([0.0001])
values.append([0.0])

params.append("EvalConfig.num_train_eval = {}\n")
values.append([50])

params.append("EvalConfig.num_test_eval = {}\n")
values.append([0])


ids = []
for i in range(len(values)):
  ids.append(list(range(len(values[i]))))

choices = list(itertools.product(*ids))

configs = []
for choice in choices:
  config = ""
  config += f"include '{SOURCE_CONFIG}'\n\n"
  for i in range(len(params)):
    v = values[i][choice[i]]
    if isinstance(v, list):
      config += params[i].format(*v) + "\n"
    else:
      config += params[i].format(v) + "\n"
  configs.append(config)

for i in range(len(configs)):
  filepath = ROOT_DIR / f"{i:03d}.gin"
  with filepath.open("w") as f:
      f.write(configs[i])

  print(filepath)








