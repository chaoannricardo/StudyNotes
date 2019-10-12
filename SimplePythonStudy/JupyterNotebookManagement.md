# Jupyter Notebook Management

## Jupyter Kernel Set-up
* Reference: https://janakiev.com/blog/jupyter-virtual-envs/
* Install package to manage jupyter kernels.
    pip install --user ipykernel
* Add your conda VM into jupyter kernel
    conda activate XXXX (your VM name)
    python -m ipykernal install --user --name=XXXX
* Check jupyter kenek list
    jupyter kernelspec list
* Delete jupyter kernel
    jupyter kernelspec uninstall XXXX