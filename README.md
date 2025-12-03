# MotGen

MotGen is a bacterial motility generator that combines MATLAB-based image analysis with a Python machine learning workflow. The project demonstrates how tracking data from live-cell imaging can drive generative models for motility statistics and environment prediction while highlighting skills relevant to computer vision, machine learning, and data engineering roles.

>  Quick pitch (for recruiters and collaborators):  Ready-to-run image analysis plus GAN-based synthesis that showcases end-to-end ownership—from data wrangling and feature engineering to modeling, validation, and storytelling with visuals.

>  Portfolio note:  This repository is organized to read like a project hand-off: a concise overview, documented workflows, and runnable assets that show end-to-end ownership.

![Schematic](https://github.com/bgmseo/MotGen/assets/118337203/64635022-256d-43b4-8b75-b805f9378bc9)

## Project highlights

-  Image analysis : MATLAB image processing pipeline that extracts 15 motility features from time-lapse TIFF stacks.
-  Deep learning : GAN-based workflow in Python notebooks for synthesizing motility statistics and performing task-incremental learning.
-  Predictive modeling : Environment inference notebooks to estimate conditions such as pH and temperature from desired motility profiles.
-  Reusability : Example notebooks and scripts can serve as templates for cell-tracking projects or for augmenting motility datasets.
-  Experiment traceability : README, folder layout, and sample data are aligned so reviewers can reproduce results with minimal setup.

## Tech stack & career highlights

-  Languages : MATLAB (image analysis), Python (3.5+ for ML notebooks)
-  Frameworks : TensorFlow 2.5+, GAN-based generative modeling for data augmentation and conditional synthesis
-  Core libraries : NumPy, pandas, Matplotlib, OS/Sys utilities for data wrangling and visualization
-  MLOps-friendly assets : Notebook-first experiments that can be refactored into pipelines; clear dependency list for reproducible setups
-  Tooling : Jupyter Notebook for iterative exploration and visualization; MATLAB Image Processing Toolbox for feature extraction

## Career-aligned skills on display

-  Signal & image processing : Feature engineering from time-lapse microscopy, noise handling, and pre-processing rigor.
-  Modeling & evaluation : GAN-based synthesis plus predictive models tied to real-world outcomes (pH, temperature).
-  Data engineering : Clear folder conventions and dependency notes to support scaling experiments into pipelines.
-  Visualization & storytelling : Schematic, notebook outputs, and README flow designed to show results and rationale quickly.

### Role alignment

-  Computer Vision / ML Engineer : Demonstrates feature extraction, GAN modeling, and experiment tracking that map to productionization tasks.
-  Data Scientist : Shows exploratory notebooks, hypothesis-driven evaluation, and clarity in communicating assumptions and results.
-  Research Engineer : Highlights reproducible pipelines, structured datasets, and adaptability for new experimental conditions.

## Repository structure

- `BacTracking/`: MATLAB scripts for feature extraction from microscopy TIFF stacks (see `tracktest_BGM.m`).
- `ML/`: Jupyter notebooks for generative modeling and environment prediction.
- `Schematic.jpeg`: High-level system schematic.
- `README.md`: Project overview, skill highlights, and getting-started guide.

## Requirements

- TensorFlow (>= 2.5.0)
- Python (>= 3.5)
- Python packages: `numpy`, `pandas`, `os`, `sys`, `matplotlib`
- MATLAB Image Processing Toolbox

## Getting started

1.  Clone or download  the repository and obtain the trained models (if available for your use case).
2.  Set up Python environment  with the dependencies listed above (a virtual environment is recommended).
3.  Prepare MATLAB  with the Image Processing Toolbox for running the BacTracking workflow.

## Usage

### Image analysis: BacTracking

- Inside `Samplevideo.zip`, `exp126_8bit.tif` contains sample bacteria live-cell imaging saved as a TIFF stack.
- Run `tracktest_BGM.m` to track moving bacteria and export the 15-feature motility statistics.

### Generative model: ML notebooks

- Run `generatemotility.ipynb` to generate bacterial motility statistics in given conditions using the GAN workflow.
- Run `Motility_Predictions.ipynb` to predict environmental features (e.g., pH, temperature) that would produce desired motility statistics.

## Contact

If you have any questions or problems, please contact bgm.seo AT snu.ac.kr.
