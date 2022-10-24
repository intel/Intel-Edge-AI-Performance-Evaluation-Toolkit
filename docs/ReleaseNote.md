# Release Note for Intel® Edge AI Performance Evaluation Toolkit 1.0


## Introduction

Intel® Edge AI Performance Evaluation Toolkit is an Edge AI customer enabling tool that has been designed to easily qualify and evaluate platform deep learning inference performance.

## New in This Release

This is the first release of Intel® Edge AI Performance Evaluation Toolkit.

## Known Limitations
The toolkit has been validated on Intel® platforms Tigerlake Intel® Core™ i7-1165G7 Processor, Intel® Core™ i7-1185G7E Processor and Intel® Celeron® 6305E and OpenVINO™ toolkit v.2022.1.

## Included in This Release

It consists of scripts, configuration files, Intel Thermal Analysis Tool (TAT) workspace file and optimized OpenVINO INT8 IR model and brief explanation below,

* **OS setup scripts** - are used to setup container running environment on both Ubuntu Linux and Windows OS. 

*  **OpenVINO POT quantization scripts and configuration files** - are used to quantize OpenVINO FP32/FP16 IR models to INT8 by OpenVINO Post-Training Optimization Tool.

* **Benchmark scripts and Intel TAT workspace file** - are used to benchmark optimized INT8 IR model and monitor system frequency and thermal condition to qualify system performance.

## Hardware and Software Compatibility

Supported Intel Processors

* Intel® Core™ i7-1185G7E Processor
* Intel® Core™ i7-1165G7 Processor
* Intel® Celeron® 6305E

Supported Operating Systems

* Windows 10 21H2 64 bit
* Ubuntu* 20.04 long-term support (LTS), 64-bit

## Where to Find This Release

Intel® Edge AI Performance Evaluation Toolkit can be  found from https://github.com/intel/Intel-Edge-AI-Performance-Evaluation-Toolkit

## Helpful Link

[Intel® Power And Thermal Analysis Tool](https://www.intel.com/content/www/us/en/secure/design/confidential/software-kits/kit-details.html?kitId=637737)		 

[Intel® Distribution of OpenVINO™ toolkit Benchmark Results](https://docs.openvino.ai/latest/openvino_docs_performance_benchmarks_openvino.html#doxid-openvino-docs-performance-benchmarks-openvino)


## Legal Information

You may not use or facilitate the use of this document in connection with any infringement or other legal analysis concerning Intel products described herein. You agree to grant Intel a non-exclusive, royalty-free license to any patent claim thereafter drafted which includes subject matter disclosed herein.

No license (express or implied, by estoppel or otherwise) to any intellectual property rights is granted by this document.

All information provided here is subject to change without notice. Contact your Intel representative to obtain the latest Intel product specifications and roadmaps.

The products described may contain design defects or errors known as errata which may cause the product to deviate from published specifications. Current characterized errata are available on request.

Intel technologies’ features and benefits depend on system configuration and may require enabled hardware, software or service activation. Learn more at http://www.intel.com/ or from the OEM or retailer.

No computer system can be absolutely secure.

Intel, Atom, Arria, Core, Movidius, Xeon, OpenVINO, and the Intel logo are trademarks of Intel Corporation in the U.S. and/or other countries.

OpenCL and the OpenCL logo are trademarks of Apple Inc. used by permission by Khronos

*Other names and brands may be claimed as the property of others.

Copyright © 2022, Intel Corporation. All rights reserved.

For more complete information about compiler optimizations, see our [Optimization Notice](https://software.intel.com/en-us/articles/optimization-notice#opt-en).
