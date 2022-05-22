# Arcane incantation to print all the other targets, from https://stackoverflow.com/a/26339924
help:
	@$(MAKE) -pRrq -f $(lastword $(MAKEFILE_LIST)) : 2>/dev/null | awk -v RS= -F: '/^# File/,/^# Finished Make data base/ {if ($$1 !~ "^[#.]") {print $$1}}' | sort | egrep -v -e '^[^[:alnum:]]' -e '^$@$$'

conda:
	wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
	bash Miniconda3-latest-Linux-x86_64.sh
	conda create --name finetune-env python=3.8
	echo "RUN: conda activate finetune-env"

git:
	git clone https://github.com/JayThibs/mesh-transformer-jax
	cd mesh-transformer-jax/

pip:
	pip install --use-deprecated=legacy-resolver -r requirements.txt
	pip install "jax[tpu]>=0.2.16" -f https://storage.googleapis.com/jax-releases/libtpu_releases.html
	pip install -U tensorflow