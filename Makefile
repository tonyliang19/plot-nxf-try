help:
	@echo "displays this message"

interactive:
	@echo "Submmitting interactive job"
	@echo "Remeber to 'module purge', then 'module load CVMFS_CC to load CC stuff"
	@echo "Then just simply run 'sh run_remote.sh' after you loaded new modules"
	@echo ""
	@salloc --time=4:0:0 --mem=8G --nodes=1 --ntasks=8 --account=${ALLOC}