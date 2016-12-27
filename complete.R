complete <- function(dir, id=1:332) {
  nobs <- NULL
  for (f in id) {
    filedata <- read.csv(file.path(dir, sprintf('%03d.csv', f)))
    cmpl <- complete.cases(filedata)
    nobs <- append(nobs, nrow(filedata[cmpl,]))
  }
  data.frame(id, nobs)
}