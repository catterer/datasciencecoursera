pollutantmean <- function(dir, poll, id = 1:332) {
  if (poll != 'sulfate' && poll != 'nitrate')
    stop("invalid pollutant")
  res <- NULL
  for (f in id) {
    filedata <- read.csv(file.path(dir, sprintf('%03d.csv', f)))
    res <- append(res, filedata[[poll]])
  }
  bad = is.na(res)
  mean(res[!bad])
}