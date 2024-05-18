#!/usr/bin/env python
"""
Use this as the docopt string to run stuff

Usage:
  plot_normal_dist.py [options]

Options:
  --mu=MU Number of mean [default: 1]
  --sd=SD Number of standard deviation [default: 1]
"""

from docopt import docopt
import numpy as np
# This uses a non-interactive backend for plotting
# see https://stackoverflow.com/questions/9622163/save-plot-to-image-file-instead-of-displaying-it
import matplotlib.pyplot as plt
plt.switch_backend('Agg')
import scipy.stats as stats

def main(mu, sd):
  # One is the mean, and one is standard deviation
  x = np.linspace(mu - 3*sigma, mu + 3*sigma, 100)
  plt.plot(x, stats.norm.pdf(x, mu, sigma))
  plt.title(f'Normal distribution with mu = {mu}, sigma = {sigma}')
  # Save the fig
  filename = f"normal_distribution-mu_{mu}-sigma_{sd}.png"
  plt.savefig(filename)
  return None

if __name__ == '__main__':
  # Parse docopt
  args = docopt(__doc__)
  # Execute the main function
  main(mu=args['--mu'], sd=args['--sd'])

