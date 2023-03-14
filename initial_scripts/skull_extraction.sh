#!/usr/bin/bash

fast -o sub-Ebdo_ses-01_rec-mean_petra_roi5_bias.nii.gz -l 3 -b -B sub-Ebdo_ses-01_rec-mean_petra_roi5.nii.gz

fslmaths sub-Ebdo_ses-01_rec-mean_petra_roi5_bias_restore.nii.gz -thr 125 -bin sub-Ebdo_ses-01_restore_head_125.nii.gz

fslmaths sub-Ebdo_ses-01_restore_head_125.nii.gz -kernel boxv 5 -dilD sub-Ebdo_ses-01_restore_head_125_dilD5.nii.gz

fslmaths sub-Ebdo_ses-01_restore_head_125_dilD5.nii.gz -kernel boxv 5 -ero sub-Ebdo_ses-01_restore_head_125_dilD5_ero5.nii.gz

#fslmaths sub-Ebdo_ses-01_rec-mean_petra_roi5_bias_restore.nii.gz -recip -log sub-Ebdo_ses-01_rec-mean_petra_roi5_bias_restore_recip_log.nii.gz

#fslmaths sub-Ebdo_ses-01_rec-mean_petra_roi5_bias_restore_recip_log.nii.gz -mas sub-Ebdo_ses-01_restore_head_125_dilD5_ero5.nii.gz sub-Ebdo_ses-01_rec-mean_petra_roi5_bias_restore_recip_log_masked.nii.gz

fslmaths sub-Ebdo_ses-01_rec-mean_petra_roi5_bias_restore.nii.gz -mas sub-Ebdo_ses-01_restore_head_125_dilD5_ero5.nii.gz sub-Ebdo_ses-01_rec-mean_petra_roi5_bias_restore_masked.nii.gz

fslmaths sub-Ebdo_ses-01_rec-mean_petra_roi5_bias_restore_masked.nii.gz -uthr 120 sub-Ebdo_ses-01_rec-mean_petra_roi5_bias_restore_masked_uthr120.nii.gz



