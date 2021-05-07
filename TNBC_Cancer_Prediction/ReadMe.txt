This folder contains the scripts for a project from the Advanced Bioinformatics course I took in my Master's program. 
It was my first experience in pipeline development and working within an interdisciplinary team, as well as leading it. Within 4 weeks, we were
able to create a robust method for classifying triple-negative breast cancer, a severe form, using mRNAseq profiles from 
the TCGA database. 

This pipeline was python-based mostly using the scikit-learn package. Additionally, I used the keras-tensorflow package for 
creation of a neural network. My assigned portion consisted of data mining, dimensionality reduction using
varied forms of a Stacked Autoencoder, and supervised machine learning using the k-Nearest Neighbor (KNN) classifier. The statistical results concluded
that the autoencoder was poor for classification, the reason hypothesized is overcompression, and the KNN as the best classifier when paired with 
Priniciple Coordinate Analysis for dimensionality reduction. 
