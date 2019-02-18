# Code for CWL-metrics manuscript

This repository contains:

- Status check script for cwltool runs on multiple EC2 instances (lib/check_status.sh)
- Script to merge multiple CWL-metrics JSON data (lib/merge_multiple_metrics.rb)
- Jupyter notebook for data analysis and plot (notebook)

## View notebook data on nbviewer

[The notebook can be browsed on nbviewer](https://nbviewer.jupyter.org/github/inutano/cwl-metrics-manuscript/blob/master/notebook/CWL-metrics%20runtime%20metrics%20analysis.ipynb)

## Reproduce analysis

1. Open the terminal app and `git clone https://github.com/inutano/cwl-metrics-manuscript` to clone this repo
2. Run `init.sh` to launch Jupyter notebook docker container
3. Open the URL shown on terminal
4. Open the notebook at `/work/notebook/CWL-metrics runtime metrics analysis.ipynb`
5. Push Play!
