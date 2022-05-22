
conda:
	wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
	bash Miniconda3-latest-Linux-x86_64.sh
	echo "Close the window for Conda to work!"

conda-env:
	conda create --name finetune-env python=3.8
	echo "RUN: conda activate finetune-env"

pip:
	pip install --use-deprecated=legacy-resolver -r requirements.txt
	pip install "jax[tpu]>=0.2.16" -f https://storage.googleapis.com/jax-releases/libtpu_releases.html

train:
	python3 device_train.py --config=configs/alignment_config.json --tune-model-path=gs://gpt-alignment/step_383500/