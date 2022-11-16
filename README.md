# mb-PHENIX Imputation  (2022; Code for paper)


[![Open Example In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/drive/1lpdCy7HkC5TRI9LfUtIHBBW8oRO86Nvi?usp=sharing)


==============================

!![myimage-alt-tag](https://github.com/resendislab/mb-PHENIX/blob/main/Screen%20Shot%202022-03-29%20at%2017.31.00.png)



### What is mb-PHENIX

The supervised based imputation of mb-PHENIX is based on the assumption that data present on high amounts of missing data, that do not let the user find a well-clustered structure on the microbiota data. Another assumption is that microbiota data is high-dimensional and using traditional reductional such as PCA or any Multidimensional scaling variants does not permit finding well patterns. 

Therefore,  mb-PHENIX  is ideal for datasets where similar samples have the same experimental sampling process and sequencing methodology. However, due to technological noise, does not allow finding patterns and much information about the differential expression of taxa.


### How to use

The user needs to have knowledge of how to use of pandas and numpy libraries, this implies that the user has python knowledge. Any free course, cursera or udeamy course can be used to learn faster this python libraries, for recent users please go in here  [click here](https://www.udemy.com/share/101WaU3@3A6uj9QXHRFfZxf59mg8aLG7J1eXrfzT5RKo5SO1VRl9RxsqCEINIxSf67WH3GsG/) to learn the basics.

mb-PHENIX is based manly of the use of UMAP, so the abundance matrix need to be transformed into a lower dimensionality using UMAP if data has no cluster strucutre please use UMAP in supervised manner(needs label information controls and cases for example in integers), more information in here [click here](https://umap-learn.readthedocs.io/en/latest/supervised.html). 

### How to use

The input for the funcion mb-PHENIX are objects pandas or numpy object from the abundance matrix and the UMAP output, in the example of the image showed below are count matrix for the abundance matrix, data ump vis super for the UMAP output.

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


The main implementation of this code is available in `umap.parametric_umap` in the [UMAP repository](https://github.com/lmcinnes/umap) (v0.5+). Most people reading this will want to use that code, and can ignore this repository. 

The code in this repository is the 'messy' version. It has custom training loops which are a bit more verbose and customizable. It might be more useful for integrating UMAP into your custom models. 

The code can be installed with `python setup.py develop`. Though, unless you're just trying to reproduce our results, you'll probably just want to pick through the notebooks and tfumap folder for the code relevant to your project. 

In addition, we have a more verbose Colab notebook to walk you through the algorithm:

mb-PHENIX is available in [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/drive/1lpdCy7HkC5TRI9LfUtIHBBW8oRO86Nvi?usp=sharing)


### What's inside

This repo contains the code needed to produce all of the results in the paper. The network architectures we implement (in Tensorflow) are non-parametric UMAP, Parametric UMAP, a UMAP/AE hybrid, and a UMAP/classifier network hybrid. 

![network-outlines](images/network-outlines.png)

The UMAP/classifier hybrid can be used for semisupervised learning on structured data. An example with the moons dataset is shown below, where in the left panel, the colored points are labeled training data, the grey points are unlabled data, and the background is the network's decision boundary. 

![semisupervised-example](images/semisupervised-s-example.png)

