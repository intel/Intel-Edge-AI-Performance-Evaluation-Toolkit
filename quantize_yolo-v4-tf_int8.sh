#!/bin/bash

#
# Use OpenVINO dockerhub image to quantize YOLO v4 model
#

if [ ! -d "$HOME"/Downloads/coco_dataset ]; then
  echo "Please download MS COCO dataset by running bash tools/download_coco_dataset.sh"
  exit 1
fi

if [ ! -d "$HOME"/Downloads/openvino_models/ ]; then
  echo "$HOME/Downloads/openvino_models dosen't exist"
  echo "Creating $HOME/Downloads/openvino_models"
  mkdir -p "$HOME"/Downloads/openvino_models
fi

cp openvino_models/public/yolo-v4-tf/yolo-v4-tf-int8.yml "$HOME"/Downloads/
cp openvino_models/public/yolo-v4-tf/yolo-v4-tf-int8.json "$HOME"/Downloads/

docker run -t -d --rm --name yolov4 -v "$HOME"/Downloads:/mnt openvino/ubuntu20_dev:2022.1.0

# Download YOLO-V4-TF
docker exec yolov4 omz_downloader --name yolo-v4-tf -o /mnt/openvino_models

# MO YOLO-V4-TF to FP32 and FP16
docker exec yolov4 omz_converter --name yolo-v4-tf -d /mnt/openvino_models -o /mnt/openvino_models

docker exec yolov4 bash -c "ln -s /mnt/coco_dataset /home/openvino/coco_dataset"

# Run Accruacy Checker on YOLO-V4-TF IR model with MS COCO 2017 dataset
docker exec yolov4 bash -c "accuracy_check -c /mnt/yolo-v4-tf-int8.yml -m /mnt/openvino_models/public/yolo-v4-tf/FP32 -ss 300"

# Run Post-Training Optimization Tool on YOLO-V4-TF FP16 IR to create FP16-INT8 IR
docker exec yolov4 bash -c "pot -c /mnt/yolo-v4-tf-int8.json -e --output-dir /mnt/openvino_models/public/yolo-v4-tf/FP16-INT8"

# Copy generated FP16-INT8 IR 
docker exec yolov4 bash -c "mv /mnt/openvino_models/public/yolo-v4-tf/FP16-INT8/yolo-v4-tf_DefaultQuantization/*/log.txt /mnt/openvino_models/public/yolo-v4-tf/FP16-INT8/"
docker exec yolov4 bash -c "mv /mnt/openvino_models/public/yolo-v4-tf/FP16-INT8/yolo-v4-tf_DefaultQuantization/*/optimized/* /mnt/openvino_models/public/yolo-v4-tf/FP16-INT8/"
docker exec yolov4 bash -c "rm -rf /mnt/openvino_models/public/yolo-v4-tf/FP16-INT8/yolo-v4-tf_DefaultQuantization"

docker kill yolov4
