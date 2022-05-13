#!/bin/bash

export CUDA_VISIBLE_DEVICES=1,2,3,4,5,6,7
python main.py --maxdisp 192 \
               --model stackhourglass \
               --datapath /home/joso/PSMNet-1/dataset/ \
               --epochs 10 \
               --savemodel ./trained/

python finetune.py --maxdisp 192 \
                   --model stackhourglass \
                   --datatype 2015 \
                   --datapath /home/joso/kitti/data_scene_flow/training/ \
                   --epochs 300 \
                   --loadmodel ./trained/checkpoint_9.tar \
                   --savemodel ./trained/

