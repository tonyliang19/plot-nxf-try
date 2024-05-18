#!/bin/bash

# =============================================================================
# Script to run remote_scratch, only use this when you are in interactive job
# salloc --time=1:0:0 --mem=3G --nodes=1 --ntasks=2 --account=st-singha53-1
#
# Here requested two CPU cores and 3 GB of memory using salloc command. 
# Once the allocation is granted, you can proceed with your work 
# within the interactive session.
# ----------------------------------------------------------------------------
# Execute this script various time if needed
# =============================================================================
ENV_FILE="./.env"

#source bin/helper.sh # Source the load script with env vars setup
set -o allexport
. ${ENV_FILE} # This sources .env
set +o allexport

PIPELINE_DIR=$(eval pwd)
export APPTAINER_IMAGE_CACHE_DIR="/arc/project/${ALLOCATION_CODE}/${USER}/MESSI-apptainer-images"
# The NXF script to start
NXF_SRC_MAIN=main.nf
#NXF_SRC_MAIN=small.nf

# Run command 
# Load some modules if not loaded
# and silenced its output & error by redirecting to null device
#module purge & module load CVMFS_CC gcc apptainer nextflow

# Run the nextflow file
# module purge
#module restore nxf_jobs
module load apptainer/1.1.8 
module load java/11.0.16_8
module load nextflow/23.04.3
OUTDIR=run1
export NXF_WORK="$PIPELINE_DIR/work"
export NXF_HOME=$PIPELINE_DIR
export NXF_OFFLINE='TRUE'

echo "Running pipeline with ${NXF_SRC_MAIN}"

nextflow run ${NXF_SRC_MAIN} -profile sockeye

