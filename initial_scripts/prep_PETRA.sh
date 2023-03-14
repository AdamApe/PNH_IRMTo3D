
#script to prepare skull extraction from PETRA images

#julien.sein@univ-amu.fr, january 23rd 2023

##### To be defined by user #######

study=Marmoset
sub=Paolina
ses=01
ANAT_DIR=~/Documents/Centre_IRMf/DATA/BIDS/$study/sub-${sub}/ses-${ses}/anat

TEMPLATE_DIR=~/Documents/Centre_IRMf/DATA/BIDS/Marmoset

####################################

#fslroi $ANAT_DIR/sub-${sub}_ses-${ses}_rec-mean_petra.nii.gz \
#	$ANAT_DIR/sub-${sub}_ses-${ses}_rec-mean_petra_roi.nii.gz \
#	$(cat $ANAT_DIR/sub-${sub}_ses-${ses}_rec-mean_petra_crop.txt)

robustfov -i $ANAT_DIR/sub-${sub}_ses-${ses}_rec-mean_petra.nii.gz -r $ANAT_DIR/sub-${sub}_ses-${ses}_rec-mean_petra_roi.nii.gz -b 35
#l'étape ci-dessus n'est pas nécessaire car nous avons déjà une image cropped avec fslroi

fslmaths $ANAT_DIR/sub-${sub}_ses-${ses}_rec-mean_petra_roi.nii.gz -thr 120 -bin -kernel boxv 3 -ero $ANAT_DIR/sub-${sub}_ses-${ses}_head_ero.nii.gz
#l'étape ci-dessus n'est pas nécessaire non plus (julien a dit ça)

fast -o $ANAT_DIR/sub-${sub}_ses-${ses}_rec-mean_petra_roi_bias.nii.gz -l 3 -b -B $ANAT_DIR/sub-${sub}_ses-${ses}_rec-mean_petra_roi.nii.gz

fslmaths thr(ce thr ne doit pas etre la) $ANAT_DIR/sub-${sub}_ses-${ses}_rec-mean_petra_roi_bias_restore.nii.gz -thr 10 -bin -ero $ANAT_DIR/sub-${sub}_ses-${ses}_head_ero.nii.gz

fslmaths $ANAT_DIR/sub-${sub}_ses-${ses}_rec-mean_petra_roi_bias_restore.nii.gz -recip -log $ANAT_DIR/sub-${sub}_ses-${ses}_rec-mean_petra_roi_bias_restore_recip_log.nii.gz


