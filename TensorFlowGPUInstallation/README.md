# TensorFlowGPUInstallation

<br/>

## Reference: https://bit.ly/2JzrSsW, https://bit.ly/2NUalzI

<br/>

## Steps:
* Install Nvidia driver.
* Install TensorFlow-GPU Version by using Command: "pip install --ignore-installed --upgrade tensorflow-gpu" (Virtual Environment and Anaconda panckages are recommended.)
* Install CUDA toolkit.
* Install cudnn packages.
* Set enviroment variables within PATH.
* Activate Python console, check whether TensorFlow-GPU is installed properly by using command: "from tensorflow.python.client import device_lib", "print(device_lib.list_local_devices())"
* If the CUDA copute capability is lower then that required by TensorFlow-GPU version, you may have to edit "tensorflow\python\_pywrap_tensorflow.pyd", by searching regex "3\.5.*5\.2", and replace both 3.5 with 3.0 (for instance).
