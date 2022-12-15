# mb-PHENIX Imputation  


=======================================================================================================

![myimage-alt-tag](https://github.com/resendislab/mb-PHENIX/blob/main/Screen%20Shot%202022-03-29%20at%2017.31.00.png)



### What is mb-PHENIX

The supervised based imputation of mb-PHENIX is based on the assumption that data present on high amounts of missing data, that do not let the user find a well-clustered structure on the microbiota data. Another assumption is that microbiota data is high-dimensional and using traditional reductional such as PCA or any Multidimensional scaling variants does not permit finding well patterns. 

Therefore,  mb-PHENIX  is ideal for datasets where similar samples have the same experimental sampling process and sequencing methodology. However, due to technological noise, does not allow finding patterns and much information about the differential expression of taxa.


### What you need to know first

The user needs to have knowledge of how to use of pandas and numpy libraries, this implies that the user has python knowledge. Any free course, cursera or udeamy course can be used to learn faster this python libraries, for recent users please go in here  [click here](https://www.udemy.com/share/101WaU3@3A6uj9QXHRFfZxf59mg8aLG7J1eXrfzT5RKo5SO1VRl9RxsqCEINIxSf67WH3GsG/) to learn the basics.

mb-PHENIX is based mainly of the use of UMAP, so the abundance matrix need to be transformed into a lower dimensional space using UMAP if data has no cluster strucutre please use UMAP in supervised manner(needs label information controls and cases for example in integers), more information in here [click here](https://umap-learn.readthedocs.io/en/latest/supervised.html). 

### How to use

The input for the funcion mb-PHENIX are objects pandas or numpy object from the abundance matrix and the UMAP output, in the example of the image showed below are count matrix for the abundance matrix, data_umap_vis_super for the UMAP output.

!![myimage-alt-tag](https://github.com/resendislab/mb-PHENIX/blob/main/parameters.jpg)


For sUMAP parameters:
For more understanding of how to embed data in a supervised manner with UMAP please refer to the UMAP documentation (https://umaplearn.readthedocs.io/en/latest/supervised.html)

`target_weight`: For supervised embedding with UMAP, the parameter is a weighting factor between data topology and target topology. A value of
0.0 weights predominantly on data, a value of 1.0 places a strong emphasis on target (reflected in 2D as well-defined and separated clusters). The default of 0.5 balances the weighting equally between data and target, see Fig S4. Essentially umap takes the labels as a separate metric space (with
a categorical distance on it) and tries to fold the two data and labels together by performing an intersection of the simplicial sets. The parameter
target_weight provides some level of balance between how much weight is applied to the label vs data. A target_weight of 1.0 will put almost all
the weight on the labels, while a target_weight of 0.0 will weight as much
as can be managed in favour of the data. 

`n_neighbors`: For supervised UMAP embeddings it is recommended to use a higher value of n_neighbors. However, if the user is only interested
mostly in very local information can use low values of n_neighbors.

`target_metric`: By default, the target_metric is set to ‘categorical’, we do not recommend changing this parameter to another metric such as euclidean.
For more UMAP parameters to tune the embeddings please refer to the
work of McInnes et al., 2018.

The important parameters for mb-PHENIX function are:

`knn` and `decay`: For the adaptive kernel to construct the Markovian matrix, the user chooses a knn value that is the number of nearest neighbors from which to compute kernel bandwidth. The parameter decay is the decay rate of kernel tails. By default, the decaying kernel is set to 1, we recommend default setting for decay. For small datasets we recommend a set knn value sufficient to avoid over-smoothing to other clusters but not too small to alter the connectivity of data as a graph.

`t` : For the diffusion process, the parameter t (diffusion time) is the power
value to which the Markovian matrix is powered. This sets the level of
diffusion.

The `knn` and `t` values need to be sufficient to build a complete graph (considering the class) and less to avoid over-smooth taxa to other distinct classes.


plase make sure if you want to use on colab download and install umap 


## 1) install umap
put this in a colab cell and run it to pip install UMAP! from [click here](https://umap-learn.readthedocs.io/en/latest/supervised.html). 
```python
!pip install umap-learn
```
## 2) import libraries
then in other cell import the libraries to connect our github to the colab and pandas and visualization (use the visualization that you want)
```python
import requests
import os
import urllib.request
import pandas as pd
import numpy as np
import seaborn as sns
```
## 3) download mb-PHENIX python script 

in other cell download mb-phenix
```python
url_mbphenix = 'https://raw.githubusercontent.com/resendislab/mb-PHENIX/main/CODE/mb-phenix%20code/mb_PHENIX.py'
```
## 4) import mb-PHENIX
then in other cell import mb-phenix 
```python
from mb_PHENIX import mbPHENIX
```

## Here a tutorial of mb-PHENIX
Warning! UMAP sometimes is not reproducible among different machines if you working in your computer that fine, but if you work in colab in each sesion you will have a different machine, so carefull. The code is in [here](https://raw.githubusercontent.com/resendislab/mb-PHENIX/main/CODE/mb-phenix%20code/mb_PHENIX.py
) if you want to use it on your computer for reproducibility purposes. Or just save the umap coordinates in then run with sc-PHENIX. The diffusion process in mb-PHENIX does not have reproducibility issues is just matrix operations.

mb-PHENIX is available in colab [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/resendislab/mb-PHENIX/blob/main/mb_PHENIX_try_me_example.ipynb)

Just click in run all to see mb-phenix in action for the T2D data
!![myimage-alt-tag](https://github.com/resendislab/mb-PHENIX/blob/main/try%20me.png)




