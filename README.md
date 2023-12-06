# MotGen
MotGen: Bacterial Motility Generator 
We present the MotGen as a combination of Matlab image analysis code and ML workflow as a series of Python code using Jupyter Notebook. The ML workflow is a generative method for bacterial motility statistic features. The selected features extracted from live-cell images are delivered to a GAN model, and the imputed values are generated by using task-incremental learning. The example codes can be used as a template for cell tracking or implement trained models to generate bacterial motility statistics. 
![Schematic](https://github.com/bgmseo/MotGen/assets/118337203/64635022-256d-43b4-8b75-b805f9378bc9)

# Requirements 
* Tensorflow (>= 1.8.0)
* Python (>= 2.7)
* Python packages : numpy, pandas, os, sys, matplotlib
* Matlab Image Processing Toolbox

# usage 
download source code files and trained models. 

# Image Analysis: BacTracking
* "exp126_8bit.tif" are the example bacteria live cell imaging saved in a series of tif files 
* "tracktest_BGM.m" complementary Matalab codes that track moving bacteria with a summary of extracted 15 motility feature statistics. 
  
# Generative Model : ML 
* Run "generatemotility.ipynb" to generate bacterial motility statistics
* Run "Motility_Predictions.ipynb" to predict environments (pH, Temperature) for desired motility features 

# Contact 
If you have any questions or problems, please contact to bgm.seo AT snu.ac.kr

