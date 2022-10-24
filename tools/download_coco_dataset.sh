#!/bin/bash

cmd=$(which unzip)
if [ ! "$cmd" ]
then
  echo "Pleas install unzip tool for uncompressing COCO dataset."
  exit 1
fi

# Preparing MS COCO 2017 dataset

if [ -d "$HOME"/Downloads/coco_dataset ]
then
  echo "$HOME/Downloads/coco_dataset is found"
else
  mkdir -p "$HOME"/Downloads/coco_dataset
fi

if [ -f "$HOME"/Downloads/coco_dataset/val2017.zip ]
then
  echo "$HOME/Downloads/coco_dataset/val2017.zip is found"
else
  curl -o "$HOME"/Downloads/coco_dataset/val2017.zip http://images.cocodataset.org/zips/val2017.zip

fi

if [ -d "$HOME"/Downloads/coco_dataset/val2017 ]
then
  echo "$HOME/Downloads/coco_dataset/val2017 is found"
else
  unzip  "$HOME"/Downloads/coco_dataset/val2017.zip -d "$HOME"/Downloads/coco_dataset
fi

if [ -f "$HOME"/Downloads/coco_dataset/trainval_2017.zip ]
then
  echo "$HOME/Downloads/coco_dataset/trainval_2017.zip is found"
else
  curl -o "$HOME"/Downloads/coco_dataset/trainval_2017.zip http://images.cocodataset.org/annotations/annotations_trainval2017.zip
fi

if [ -d "$HOME"/Downloads/coco_dataset/trainval_2017 ]
then
  echo "$HOME/Downloads/coco_dataset/trainval_2017 is found"
else
  unzip  "$HOME"/Downloads/coco_dataset/trainval_2017.zip -d "$HOME"/Downloads/coco_dataset
fi
