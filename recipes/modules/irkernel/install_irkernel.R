install.packages(c(
  'repr',
  'IRdisplay',
  'evaluate',
  'crayon',
  'pbdZMQ',
  'devtools',
  'uuid',
  'digest'
), repos='https://cloud.r-project.org')

devtools::install_github('IRkernel/IRkernel')

IRkernel::installspec()
