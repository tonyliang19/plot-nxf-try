process PLOT_R {
  // this reads in from local cache dir
  label 'process_single'
  publishDir "${params.outdir}/R-plots", mode: 'copy'
  container "codia.sif"
  input:
  val mu
  val sd
  
  output:
  path("*.png"), emit: fig
  script:
  """
  plot_normal_dist.R --mu=${mu} --sd=${sd}
  """

}

process PLOT_PYTHON {
  // this reads in from local cache dir
  label 'process_single'
  publishDir "${params.outdir}/python-plots", mode: 'copy'
  container "mogonet.sif"
  input:
  val mu
  val sd
  
  output:
  path("*.png"), emit: fig
  script:
  """
  plot_normal_dist.py --mu=${mu} --sd=${sd}
  """

}


// Use this to test running plotting functions
workflow {
  main:
  log.info "This is the start of the pipeline"
  
  ch_means = Channel.fromList([5,10,50])
  ch_vars = Channel.fromList([1, 4 , 9])
  // This runs a process in R
  PLOT_R ( ch_means, ch_vars )
  PLOT_PYTHON (ch_means, ch_vars)
} 