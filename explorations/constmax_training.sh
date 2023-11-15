#/bin/bash

# head to repo root
cd ../

# create train.bin and val.bin splits (retaining contiguous sections of data)
python3 data/shakespeare_char/prepare.py

# start training
python3 train.py \
  --max_iters 8000 \
  --eval_iters 200 \
  --eval_interval 200 \
  --log_interval 10 \
  --use_softmax_variant \
  --softmax_variant "constantmax" \
  --tensorboard_project "softmax_explorations" \
  --tensorboard_run_name "consmax_base_e" \
  --block_size 256  \
  --out_dir "consmax_evaluations" \
  --compile

# start training
python3 train.py \
  --max_iters 8000 \
  --eval_iters 200 \
  --eval_interval 200 \
  --log_interval 10 \
  --use_softmax_variant \
  --softmax_variant "softermax" \
  --tensorboard_project "softmax_explorations" \
  --tensorboard_run_name "softermax" \
  --block_size 256  \
  --out_dir "softermax_evaluations" \
  --compile

# start training
python3 train.py \
  --max_iters 8000 \
  --eval_iters 200 \
  --eval_interval 200 \
  --log_interval 10 \
  --no-use_softmax_variant \
  --tensorboard_project "softmax_explorations" \
  --tensorboard_run_name "regular_softmax" \
  --block_size 256  \
  --out_dir "softmax_evaluations" \
  --compile
