# Brain Tumor Classification and Segmentation Using MATLAB

This project was developed as part of a university examination and explores the application of **image processing, machine learning, fuzzy logic, and optimization techniques** to brain MRI analysis using MATLAB.

The project is divided into two main stages:

- **Step A — Brain Tumor Classification:** extracting image features from MRI scans to distinguish between different tumor categories.
- **Step B — Brain Tumor Segmentation:** identifying tumor regions using a fuzzy inference system (FIS) and genetic-algorithm-based optimization.

The goal was to apply different computational methods to medical images, from image-level feature extraction to pixel-level tumor segmentation.

## Project Status

This repository preserves the original MATLAB implementation and supporting files developed for the university examination.

I no longer have MATLAB installed, so the project has not been retested in my current environment. The code and associated resources are shared as a record of the original academic work rather than as an actively maintained application.

## Dataset

The project uses a brain MRI image dataset obtained from Kaggle, containing four categories:

- Glioma
- Meningioma
- Pituitary tumor
- No tumor

The original dataset was found on kaggle.com, however it is included in the repository.

The images are used for academic experimentation. The project is not intended for clinical diagnosis, and the dataset should not be treated as representative of all clinical MRI data.

## Methodology

### Step A — Brain Tumor Classification

The first stage focuses on extracting numerical features from MRI images to support classification.

The preprocessing and feature-extraction pipeline includes:

1. Resizing the MRI images to 128 × 128 pixels.
2. Converting RGB images to grayscale when necessary.
3. Extracting statistical and image-based features, including mean intensity, minimum and maximum intensity, standard deviation, entropy, skewness, kurtosis, and edge density.
4. Organizing the extracted features and their corresponding class labels for subsequent machine-learning analysis.

The implementation is contained in `mainA.mlx`, supported by the `extractFeatures.m` and `loadFeatures.m` functions.

### Step B — Brain Tumor Segmentation

The second stage investigates the segmentation of tumor regions using a **Fuzzy Inference System (FIS)**.

Local image features are extracted from neighborhoods around individual pixels, including intensity, local mean, standard deviation, entropy, skewness, kurtosis, range, and energy.

These features are processed by the fuzzy inference system to produce a tumor score, which is then thresholded to generate a binary segmentation mask.

The project also explores genetic-algorithm-based optimization, including:

- **Feature selection:** evaluating different combinations of input features.
- **Fuzzy rule optimization:** adjusting rule weights to improve segmentation performance.
- **Segmentation evaluation:** comparing predicted tumor masks with reference masks using the Dice coefficient and Intersection over Union (IoU).

The implementation includes MATLAB functions for feature extraction, fuzzy segmentation, optimization, and evaluation.

## Technical Skills Demonstrated

This project involved applying and combining several computational techniques:

- **Medical image processing:** preparing MRI images and extracting informative features.
- **Feature engineering:** transforming image data into numerical representations.
- **Machine learning:** working with extracted features for classification tasks.
- **Fuzzy logic:** applying rule-based inference to image segmentation.
- **Optimization:** using genetic algorithms for feature selection and fuzzy-system optimization.
- **Model evaluation:** implementing Dice and IoU metrics to assess segmentation quality.
- **MATLAB programming:** organizing a multi-stage workflow using Live Scripts, functions, and supporting files.

## How to Run

The project was developed in MATLAB and uses the following toolboxes:

- Image Processing Toolbox
- Statistics and Machine Learning Toolbox
- Fuzzy Logic Toolbox
- Global Optimization Toolbox
- Deep Learning Toolbox

To explore the original implementation:

1. Open the project folder in MATLAB.
2. Add the relevant project directories to the MATLAB path.
3. Open `step_a/mainA.mlx` for the classification stage.
4. Open `step_b/mainB_new.mlx` for the segmentation stage.
5. Keep the supporting `.m`, `.fis`, `.mat`, and dataset files in their original locations.

**Note:** These instructions describe the intended project structure. They have not been verified against a current MATLAB installation, and some adjustments may be necessary depending on the MATLAB version and environment.

## Limitations

The project was developed for educational purposes and has not been clinically validated.

The segmentation approach relies on manually designed or optimized fuzzy inference rules, and its performance may depend on the input images, selected features, and optimization settings.

Furthermore, the original implementation has not been retested since the examination, and reproducibility may depend on the MATLAB version and installed toolboxes.

## Technologies

MATLAB · Image Processing · Machine Learning · Fuzzy Logic · Genetic Algorithms · Medical Image Analysis

## Final Remarks

This project allowed me to explore different approaches to medical image analysis and gain practical experience integrating image processing, feature engineering, fuzzy inference, and optimization techniques into a larger computational workflow.

I chose to preserve and share the original implementation as an example of my academic experience with MATLAB and biomedical image analysis.
