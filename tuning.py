import itertools
from pathlib import Path

SOURCE_CONFIG = './configs/decompose/train_debug.gin'
ROOT_DIR = Path('./configs/decompose/tune/')

ROOT_DIR.mkdir(parents=True, exist_ok=True)
params = []
values = []

params.append("TrainConfig.blendw_loss_weight_schedule = {{ \n \
  'type': 'linear', \n \
  'initial_value': {}, \n \
  'final_value': {}, \n \
  'num_steps': 100000, \n \
}}")
values.append([[0.0001, 0.01], [0.0001, 0.001]])

params.append("TrainConfig.shadow_r_loss_weight = {{ \n \
  'type': 'linear', \n \
  'initial_value': {}, \n \
  'final_value': {}, \n \
  'num_steps': 100000, \n \
}}")
values.append([[0.05, 0.1], [0.05, 0.01]])



ids = []
for i in range(len(values)):
  ids.append(list(range(len(values[i]))))

choices = list(itertools.product(*ids))

configs = []
for choice in choices:
  config = ""
  config += f"include '{SOURCE_CONFIG}'\n"
  for i in range(len(params)):
    v = values[i][choice[i]]
    config += params[i].format(*v) + "\n"
  configs.append(config)

for i in range(len(configs)):
  filepath = ROOT_DIR / f"{i:03d}.gin"
  with filepath.open("w") as f:
      f.write(configs[i])








