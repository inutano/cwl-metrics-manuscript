# Code for CWL-metrics manuscript

[![DOI](https://zenodo.org/badge/153569658.svg)](https://zenodo.org/badge/latestdoi/153569658)

This repository contains:

- Status check script for cwltool runs on multiple EC2 instances (lib/check_status.sh)
- Script to merge multiple CWL-metrics JSON data (lib/merge_multiple_metrics.rb)
- Jupyter notebook for data analysis and plot (notebook)

## Related repositories

- [common-workflow-language/common-workflow-language](https://github.com/common-workflow-language/common-workflow-language)
  - Used to describe workflows
- [common-workflow-language/cwltool](https://github.com/common-workflow-language/cwltool/)
  - Used to run the workflows
- [inutano/cwl-metrics](https://github.com/inutano/cwl-metrics)
  - Used to collect runtime metrics of the workflows
- [pitagora-network/pitagora-cwl](https://github.com/pitagora-network/pitagora-cwl)
  - RNA-Seq workflows used for the benchmark

## Manuscript

- PrePrint
  - Accumulating computational resource usage of genomic data analysis workflow to optimize cloud computing instance selection. Tazro Ohta, Tomoya Tanjo, Osamu Ogasawara, bioRxiv 456756; doi: https://doi.org/10.1101/456756
- Journal
  - Ohta, T., Tanjo, T., & Ogasawara, O. (2019). Accumulating computational resource usage of genomic data analysis workflow to optimize cloud computing instance selection. GigaScience, 8(4). https://doi.org/10.1093/gigascience/giz052

## Methods

1. Launch AWS EC2 instance, install and run [CWL-metrics](https://github.com/inutano/cwl-metrics)
2. Run [pitagora-network/pitagora-cwl](https://github.com/pitagora-network/pitagora-cwl) RNA-Seq workflows by test script (`test/bin/run-cwl`)
3. Retrieve Runtime metrics in JSON format by `cwl-metrics fetch json` command
4. Repeat 1-3 for different types of EC2 instance
5. Collect JSON files from each instance, run `lib/merge_multiple_metrics.rb` to get one single TSV
6. Load the metrics TSV and append information of samples and instance types used
7. Visualize

## Jupyter notebook for visualization of benchmark results

### View notebook data on nbviewer

Browse the notebook on [nbviewer](https://nbviewer.jupyter.org/github/inutano/cwl-metrics-manuscript/blob/master/notebook/CWL-metrics%20runtime%20metrics%20analysis.ipynb)

### Data used for visualization

- Runtime metrics data of 7 different RNA-Seq quantification workflows, https://doi.org/10.6084/m9.figshare.7222775.v1
- The supplemental information for RNA-Seq workflow benchmark by CWL-metrics, https://doi.org/10.1101/456756

### Reproduce the visualization process

1. Open the terminal app and `git clone https://github.com/inutano/cwl-metrics-manuscript` to clone this repo
2. Run `init.sh` to launch Jupyter notebook docker container
3. Open the URL shown on terminal
4. Open the notebook at `/work/notebook/CWL-metrics runtime metrics analysis.ipynb`
5. Push Play!
