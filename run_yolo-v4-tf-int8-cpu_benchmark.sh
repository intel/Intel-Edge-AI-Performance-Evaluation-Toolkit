#!/bin/bash

WSL=$(uname -r | sed -n 's/.*\( *Microsoft *\).*/\1/ip')
MODEL_INT8_IR_FOLDER="public/yolo-v4-tf/FP16-INT8/"
MODEL_INT8_IR="yolo-v4-tf.xml"
DEVICE="CPU"

if [ ! -f "$HOME"/Downloads/openvino_models/"$MODEL_INT8_IR_FOLDER"/"$MODEL_INT8_IR" ]; then
  echo "$HOME/Downloads/openvino_models/$MODEL_INT8_IR_FOLDER/$MODEL_INT8_IR dosen't exist"
  echo "Please copy $MODEL_INT8_IR and .bin to $HOME/Downloads/openvino_models/$MODEL_INT8_IR_FOLDER"
  exit 1
fi


if [ -n "$WSL" ]; then
    docker run -t -d --rm --name benchmark -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY="$DISPLAY" -v "$HOME"/Downloads:/mnt --device /dev/dxg --volume /usr/lib/wsl:/usr/lib/wsl openvino/ubuntu20_dev:2022.1.0
else
    docker run -t -d --rm --name benchmark -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY="$DISPLAY" -v "$HOME"/Downloads:/mnt --device /dev/dri:/dev/dri --group-add="$(stat -c "%g" /dev/dri/render*)" openvino/ubuntu20_dev:2022.1.0
fi

docker exec benchmark bash -c "benchmark_app -m /mnt/openvino_models/$MODEL_INT8_IR_FOLDER/$MODEL_INT8_IR -d $DEVICE -api async -t 60"

docker kill benchmark