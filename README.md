# Computer Assisted Verbal Autopsy: Comparing Large Language Models to Physicians for Assigning Causes to 6939 Deaths in Sierra Leone from 2019-2022

-   [Manuscript](manuscript/wen-et-al-2025-cava-v2.pdf)

## Overview

This repository contains code to reproduce findings from the paper. The code requires R to run InterVA-5 and InSilicoVA models, as well as Python and an OpenAI API key to run GPT models. Plots are generated using R, while diagrams are created using draw.io.

Folders in this repository are organized in the following manner:

-   [archive](archive/): past versions of files with large differences
-   [bin](bin/): scripts meant to be run on the command line
-   [data](data/): public and anonymized datasets, and their data dictionaries if available
-   [src](src/): code and files for models, plots, and diagrams
    -   [figures](src/figures): draw.io files for diagrams
    -   [models](src/models): code to run each model
-   [manuscript](manuscript/): files for manuscript with related files and figures
    -   [figures](manuscript/figures): figure image files generated from R and draw.io
    -   [files](manuscript/files): additional files to submit with the manuscript

Files of interest:

-   [data/healsl_rd1to2_cod_v1.csv](data/healsl_rd1to2_cod_v1.csv): Data of cause of death coding results from models and physicians for all verbal autopsy records
-   [src/plots.Rmd](src/plots.Rmd): Code for generating figure plots using R

## Install

1.  Install

## Contact

Richard Wen [rrwen.dev\@gmail.com](mailto:rrwen.dev@gmail.com){.email} for any code or technical related issues.
