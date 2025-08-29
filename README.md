# Computer Assisted Verbal Autopsy: Comparing Large Language Models to Physicians for Assigning Causes to 6939 Deaths in Sierra Leone from 2019-2022

- [Manuscript](manuscript/wen-et-al-2025-cava-v3.docx)

## Overview

This repository contains code to reproduce findings from the paper. The code requires R to run InterVA-5 and InSilicoVA models, as well as Python and an OpenAI API key to run GPT models. Plots are generated using R, while diagrams are created using draw.io.

Folders in this repository are organized in the following manner:

- [archive](archive/): past versions of files with large differences
- [bin](bin/): scripts meant to be run on the command line
- [data](data/): public and anonymized datasets, and their data dictionaries if available
- [src](src/): code and files for models, plots, and diagrams
    - [figures](src/figures): draw.io files for diagrams
    - [models](src/models): code to run each model
- [manuscript](manuscript/): files for manuscript with related files and figures
    - [figures](manuscript/figures): figure image files generated from R and draw.io
    - [files](manuscript/files): additional files to submit with the manuscript

Files of interest:

- [data/healsl_rd1to2_cod_v1.csv](data/healsl_rd1to2_cod_v1.csv): Data of cause of death coding results from models and physicians for all verbal autopsy records
- [src/plots.Rmd](src/plots.Rmd): Code for generating figure plots using R

## Install

1. Install [git](https://git-scm.com/)
2. Install [Python 3](https://www.python.org/)
3. Install [R](https://www.r-project.org/) and [RStudio](https://posit.co/download/rstudio-desktop/)
4. Install [draw.io](https://www.drawio.com/) (to edit diagrams under [src/figures](src/figures))
5. If on Windows, install [RTools](https://cran.r-project.org/bin/windows/Rtools/)
6. Open a command line interface and clone this repository `git clone https://github.com/cghr-toronto/healsl-gpt-paper`
7. Navigate into the cloned folder `cd healsl-gpt-paper`
8. Create a tmp folder for temporary files not tracked by git `mkdir tmp`
    * This folder is used for model input and output data
    * Intermediate files from running code may also be stored here
    * The python environment also exists under `tmp/venv`
9. Setup the python environment using scripts in the [bin folder](bin/) with the following command:
    * MacOS/Linux: `source bin/setup_python.sh`
    * Windows: `bin\setup_python`
10. Install [pycrossva](https://github.com/verbal-autopsy-software/pyCrossVA) v0.97 in Python with the following commands:
    * MacOS/Linux: `source bin/activate` then `source bin/setup_pycrossva.sh`
    * Windows: `bin\activate` then `bin\setup_pycrossva`
11. Open RStudio, and install the required R packages with the [src/install.R script](src/install.R) in the R terminal: `source("src/install.R")`
12. All required software should now be installed

## Reproducing Study Results

1. Email the authors for access to the following files:
    * `icd10_cghr10_v1.csv`
    * `healsl_rd1to2_who151_v1.csv`
    * `healsl_rd1_adult_v1.csv`
    * `healsl_rd1_adult_age_v1.csv`
    * `healsl_rd1_adult_narrative_v1.csv`
    * `healsl_rd2_adult_v1.csv`
    * `healsl_rd2_adult_age_v1.csv`
    * `healsl_rd2_adult_narrative_v1.csv`
    * `healsl_rd1_child_v1.csv`
    * `healsl_rd1_child_age_v1.csv`
    * `healsl_rd1_child_narrative_v1.csv`
    * `healsl_rd2_child_v1.csv`
    * `healsl_rd2_child_age_v1.csv`
    * `healsl_rd2_child_narrative_v1.csv`
    * `healsl_rd1_neo_v1.csv`
    * `healsl_rd1_neo_age_v1.csv`
    * `healsl_rd1_neo_narrative_v1.csv`
    * `healsl_rd2_neo_v1.csv`
    * `healsl_rd2_neo_age_v1.csv`
    * `healsl_rd2_neo_narrative_v1.csv`
2. Put all the files above into the `tmp` folder
3. Run InterVA-5 and InSilicoVA:
    1. Open a command line interface and activate python:
        * MacOS/Linux: `source bin/activate.sh`
        * Windows: `bin\activate`
    2. Run [pycrossva](https://github.com/verbal-autopsy-software/pyCrossVA) to prepare input data `python src/models/pycrossva.py`
        * This creates prepared model input data for both InSilicoVA and InterVA-5 in the `tmp` folder
    3. Double click the file [src/src.Rproj](src/src.Rproj) to open RStudio
    4. In RStudio, run [InterVA-5](https://CRAN.R-project.org/package=InterVA5) in the R terminal `source src/models/interva5.R`
        * This creates InterVA-5 outputs with `_interva5_` in the file name
    5. In RStudio, run [InSilicoVA](https://CRAN.R-project.org/package=InSilicoVA) in the R terminal `source src/models/insilicova.R`
        * This creates InSilicoVA outputs with `_insilicova_` in the file name
    6. Both model outputs should now be available in the `tmp` folder
4. Run GPT-3.5 and GPT-4:
    1. Open a command line interface and activate python:
        * MacOS/Linux: `source bin/activate.sh`
        * Windows: `bin\activate`
    2. Create a `.env` file and add a line `OPEN_API_KEY=<your_secret_api_key>`
        * Replace `<your_secret_api_key>` with your [OpenAI API Key](https://help.openai.com/en/articles/4936850-where-do-i-find-my-openai-api-key)
        * **CAUTION**: Do not share this file or your key with anyone else, keep it safe from public access
    3. Run [GPT-3.5](https://pypi.org/project/openai/) in Python `python src/models/gpt3.py`
        * This creates GPT-3.5 outputs and intermediate files with `_gpt3_` in the file name
    4. Run [GPT-3.5](https://pypi.org/project/openai/) in Python `python src/models/gpt4.py`
        * This creates GPT-4 outputs and intermediate files with `_gpt4_` in the file name
    5. Both model outputs should now be available in the `tmp` folder
5. Gather all model outputs:
    1. Double click the file [src/src.Rproj](src/src.Rproj) to open RStudio
    2. In RStudio, open [src/data.Rmd](src/data.Rmd)
    3. Combine all outputs by running this file using the `Run` button drop down and selecting `Run All`
    4. This produces the final anonymous output data for plotting under [data/healsl_rd1to2_cod_v1.csv](data/healsl_rd1to2_cod_v1.csv)
6. Produce plots:
    1. Double click the file [src/src.Rproj](src/src.Rproj) to open RStudio
    2. In RStudio, open [src/plots.Rmd](src/plots.Rmd)
    3. Generate all plots using the `Run` button drop down and selecting `Run All`
    4. This produces several supplementary tables in the [data folder](data/) and the plots under [manuscript/figures](manuscript/figures)

## Contact

Richard Wen [rrwen.dev\@gmail.com](mailto:rrwen.dev@gmail.com) for any code or technical related issues.
