# Code for CWL-metrics manuscript

This repository contains:

- Status check script for cwltool runs on multiple EC2 instances (lib/check_status.sh)
- Script to merge multiple CWL-metrics JSON data (lib/merge_multiple_metrics.rb)
- Jupyter notebook for data analysis and plot (notebook)

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

[The notebook can be browsed on nbviewer](https://nbviewer.jupyter.org/github/inutano/cwl-metrics-manuscript/blob/master/notebook/CWL-metrics%20runtime%20metrics%20analysis.ipynb)

### Data used for visualization

- [Runtime metrics data of 7 different RNA-Seq quantification workflows, doi.org/10.6084/m9.figshare.7222775.v1](https://doi.org/10.6084/m9.figshare.7222775.v1)
- [The supplemental information for RNA-Seq workflow benchmark by CWL-metrics, doi.org/10.1101/456756](https://doi.org/10.1101/456756)

### Reproduce the visualization process

1. Open the terminal app and `git clone https://github.com/inutano/cwl-metrics-manuscript` to clone this repo
2. Run `init.sh` to launch Jupyter notebook docker container
3. Open the URL shown on terminal
4. Open the notebook at `/work/notebook/CWL-metrics runtime metrics analysis.ipynb`
5. Push Play!
