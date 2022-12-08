# Intel® Edge AI Performance Evaluation Toolkit User Guide

Intel® Edge AI Performance Evaluation Toolkit is an Edge AI customer enabling tool that has been designed to easily qualify and evaluate platform deep learning inference performance.


## Components

It consists of scripts, configuration files, Intel Thermal Analysis Tool (TAT) workspace file and optimized OpenVINO INT8 IR model and brief explanation below,

* **OS setup scripts** - are used to setup container running environment on both Ubuntu Linux and Windows OS. 

*  **OpenVINO POT quantization scripts and configuration files** - are used to quantize OpenVINO FP32/FP16 IR models to INT8 by OpenVINO Post-Training Optimization Tool.

* **Benchmark scripts and Intel PTAT workspace file** - are used to benchmark optimized INT8 IR model and monitor system frequency and thermal condition to qualify system performance.


## Supported HW

* Intel® Core™ i7-1165G7 Processor
* Intel® Core™ i7-1185G7E Processor
* Intel® Celeron® 6305E
* Intel® Core™ i7-1265U Processor
* Intel® Core™ i9-12900 Processor


## License
Intel® Edge AI Performance Evaluation  is licensed under MIT License. By contributing to the project, you agree to the license and copyright terms therein and release your contribution under these terms.


## User Guide

Below are steps to get started for Ubuntu 20.04.4 and Windows 10 21H2

### User Guide for Ubuntu 20.04

**Install Ubuntu 20.04.4**
https://ubuntu.com/tutorials/install-ubuntu-desktop#1-overview

**Clone Intel® Edge AI Performance Evaluation Toolkit**

```=bash
sudo apt update
sudo apt upgrade
sudo apt install git
git clone https://github.com/intel/Intel-Edge-AI-Performance-Evaluation-Toolkit.git
```

**Install docker utility by running**

```=bash
cd Intel-Edge-AI-Performance-Evaluation-Toolkit
bash tools/install_docker.sh
```

Reboot system.

**Install Intel Power and Thermal Analysis Tool**

Tool download link : [Intel® Power And Thermal Analysis Tool](https://www.intel.com/content/www/us/en/secure/design/confidential/software-kits/kit-details.html?kitId=637737)

![](https://i.imgur.com/JQ9QPDp.png)

**Loading Intel PTAT workspace file from ptat_workspace.xml**

![](https://i.imgur.com/FcvpSv0.png)


**Run Benchmark and Quantization Scripts**

1. **Copy yolo-v4-tf FP16_INT8 IR model to Downloads folder in Home directory**

```=bash
cd Intel-Edge-AI-Performance-Evaluation-Toolkit
cp -ar openvino_models/ $HOME/Downloads
```

2. **Run benchmark_app on yolo-v4-tf FP16_INT8 IR model on CPU**

```=bash
bash run_yolo-v4-tf-int8-cpu_benchmark.sh
```

![](https://i.imgur.com/aOpi5ZF.png)


3. **Run benchmark_app on yolo-v4-tf FP16_INT8 IR model on GPU**

```=bash
bash run_yolo-v4-tf-int8-gpu_benchmark.sh
```

![](https://i.imgur.com/G6yS6wp.png)


4. **Run quantization on yolo-v3-tf FP16 IR model**

```=bash
bash quantize_yolo-v3-tf_int8.sh
```
### User Guide for Windows 10

**Install Windows 10 21H1**

* Download Windows Insider Preview ISO (microsoft.com) and install

* Install required graphic driver (30.0.101.xxxx)


**Download Intel® Edge AI Performance Evaluation Toolkit github link below**

https://github.com/intel/Intel-Edge-AI-Performance-Evaluation-Toolkit/archive/refs/heads/main.zip

Extract to C:\Users\Public\Intel-Edge-AI-Performance-Evaluation-Toolkit.


**Enable Hypher-V (Run as Administator in PowerShell)**

Please refere to tools\enable-hyper-v.p1 and run below,

```
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V –All 
```

Press Y to reboot system.

**Install WSL2 (Run as Administator in PowerShell) and Reboot**

Please refere to tools\install_wsl2.p1 and run below,
```
wsl --install
Restart-Computer
```

After reboot, WSL will start automatically to install Ubuntu. Enter user name and password for WSL Ubuntu when prompt.

**Install docker utility by running in WSL**

```=bash
cd /mnt/c/Users/Public/Intel-Edge-AI-Performance-Evaluation-Toolkit
bash tools/install_docker.sh
```

Reboot to activate docker settings.

**Install Intel Power and Thermal Analysis Tool**

Tool download link : [Intel® Power And Thermal Analysis Tool](https://www.intel.com/content/www/us/en/secure/design/confidential/software-kits/kit-details.html?kitId=637737)

![](https://i.imgur.com/eIBHHVw.png)

![](https://i.imgur.com/GorsHl2.png)

**Launch Intel PTAT tool as administrator**

![](https://i.imgur.com/pUyTewz.png)

**Loading Intel PTAT workspace file from ptat_workspace.json**

![](https://i.imgur.com/RGt1qd9.png)


**Run Benchmark and Quantization Scripts in WSL**

1. **Copy yolo-v4-tf FP16_INT8 IR model to Downloads folder in Home directory**

```=bash
cd /mnt/c/Users/Public/Intel-Edge-AI-Performance-Evaluation-Toolkit
mkdir $HOME/Downloads
cp -ar openvino_models/ $HOME/Downloads
```

2. **Run benchmark_app on yolo-v4-tf FP16_INT8 IR model on CPU**

```=bash
bash run_yolo-v4-tf-int8-cpu_benchmark.sh
```

![](https://i.imgur.com/rXvPvTF.png)


3. **Run benchmark_app on yolo-v4-tf FP16_INT8 IR model on GPU**


```=bash
bash run_yolo-v4-tf-int8-gpu_benchmark.sh
```
![](https://i.imgur.com/dXLwmhI.png)

4. **Run quantization on yolo-v3-tf FP16 IR model**

```=bash
sudo apt install unzip
bash tools/download_coco_dataset.sh
bash quantize_yolo-v3-tf_int8.sh
```

## How to contribute
See [CONTRIBUTING](https://github.com/intel/Intel-Edge-AI-Performance-Evaluation-Toolkit/blob/main/CONTRIBUTING.md) for details. Thank you!


## Get a support
Please report questions, issues and suggestions using:
[GitHub* Issues](https://github.com/intel/Intel-Edge-AI-Performance-Evaluation-Toolkit/issues)