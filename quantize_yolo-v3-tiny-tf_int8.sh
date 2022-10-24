#!/bin/bash

#
# Use OpenVINO dockerhub image to quantize YOLO v3 Tiny model
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

cp openvino_models/public/yolo-v3-tiny-tf/yolo-v3-tiny-tf-int8.yml "$HOME"/Downloads/
cp openvino_models/public/yolo-v3-tiny-tf/yolo-v3-tiny-tf-int8.json "$HOME"/Downloads/

docker run -t -d --rm --name yolov3_tiny -v "$HOME"/Downloads:/mnt openvino/ubuntu20_dev:2022.1.0

# Download YOLO-V3-TF-Tiny
docker exec yolov3_tiny omz_downloader --name yolo-v3-tiny-tf -o /mnt/openvino_models

# MO YOLO-V3-TF-Tiny to FP32 and FP16
docker exec yolov3_tiny omz_converter --name yolo-v3-tiny-tf -d /mnt/openvino_models -o /mnt/openvino_models

docker exec yolov3_tiny bash -c "ln -s /mnt/coco_dataset /home/openvino/coco_dataset"

# Run Accruacy Checker on YOLO-V3-TF-Tiny IR model with MS COCO 2017 dataset
docker exec yolov3_tiny bash -c "accuracy_check -c /mnt/yolo-v3-tiny-tf-int8.yml -m /mnt/openvino_models/public/yolo-v3-tiny-tf/FP32 -ss 300"

# Run Post-Training Optimization Tool on YOLO-V3-TF-Tiny FP16 IR to create FP16-INT8 IR
docker exec yolov3_tiny bash -c "pot -c /mnt/yolo-v3-tiny-tf-int8.json -e --output-dir /mnt/openvino_models/public/yolo-v3-tiny-tf/FP16-INT8"

# Copy generated FP16-INT8 IR 
docker exec yolov3_tiny bash -c "mv /mnt/openvino_models/public/yolo-v3-tiny-tf/FP16-INT8/yolo-v3-tiny-tf_DefaultQuantization/*/log.txt /mnt/openvino_models/public/yolo-v3-tiny-tf/FP16-INT8/"
docker exec yolov3_tiny bash -c "mv /mnt/openvino_models/public/yolo-v3-tiny-tf/FP16-INT8/yolo-v3-tiny-tf_DefaultQuantization/*/optimized/* /mnt/openvino_models/public/yolo-v3-tiny-tf/FP16-INT8/"
docker exec yolov3_tiny bash -c "rm -rf /mnt/openvino_models/public/yolo-v3-tiny-tf/FP16-INT8/yolo-v3-tiny-tf_DefaultQuantization"

docker kill yolov3_tiny
