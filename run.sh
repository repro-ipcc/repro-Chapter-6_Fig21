#!/bin/bash

eval "$(conda shell.bash hook)"
conda activate ipcc_ch6f21

DIR=Chapter-6_Fig21

# wget https://www.ipcc.ch/report/ar6/wg1/downloads/figures/IPCC_AR6_WGI_Figure_6_21.png

# Apply changes to produce figure of $DIR

echo Patching $DIR
cd $DIR

patch < ../${DIR}.patch

python CMIP6_reg_mean_fut_PM_timeseries_IPCC_fig_AR6_regs.py
mv ../Ann_mean_2015_2100_surf_PM2pt5_resp_all_CMIP6_5_fut_scns_over_all_regions_CMIP6_multi_model_mean_AR6_regs_no_loc_plot_NTCFCH4_V1_ALL_MODS_ONLY.pdf ../IPCC_AR6_WGI_Figure_6_21.pdf

# Remove the changes
git checkout CMIP6_reg_mean_fut_O3_timeseries_IPCC_fig_AR6_regs.py