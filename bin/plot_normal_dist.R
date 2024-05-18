#!/usr/bin/env Rscript

doc <- "
Use this as the docopt string to run stuff

Usage:
  plot_normal_dist.R [options]

Options:
  --mu=MU Number of mean [default: 1]
  --sd=SD Number of standard deviation [default: 1]
"

opt <- docopt::docopt(doc)
mu <- as.numeric(opt$mu)
sigma <- as.numeric(opt$sd)

# Use this script to plot normal distribution stuff in R
normal_dist_matrix <- function(mean, sd, seed=2) {
  set.seed(seed)
  data_vector <- rnorm(mean=mean, sd=sd, n=mean*sd)
  # Then make a matrix of sd column and mean rows
  mat <- matrix(data_vector, ncol=sd)
  return(mat)
}

# Parse CLI here

# Make the data up and plot it
plot_matrix <- normal_dist_matrix(mean=mu, sd=sigma, seed=mu+sigma)
# call the device first
plot_stuff <- function(data, name) {
  
  par(mar=c(1,1,1,1))
  png(name,
  height = 8,
  width = 8,
  res=300,
  units = 'in')

  plot(data)
  dev.off()
}

name <-  paste("plot_normal_dist", "mean-",mu, "_", "sigma-",sigma, ".png", sep = "")
plot_stuff(plot_matrix, name)

#par(mar=c(1,1,1,1))
# png(
#   paste("plot_normal_dist", "mean-",mu, "_", "sigma-",sigma, ".png", sep = ""),
#   height = 8,
#   width = 8,
#   res=300,
#   units = 'in'
# )

#plot(plot_matrix)

#dev.off()
