source('complete.R')

corr <- function(dir, to=0) {
  ncmpl <- complete(dir)
  full <- ncmpl[['nobs']] > to
  good_ids <- ncmpl[full,][['id']]
  
  res <- numeric(0)
  if (!length(good_ids))
    return(res)
  
  for (f in good_ids) {
    filedata <- read.csv(file.path(dir, sprintf('%03d.csv', f)))
    cmpl <- complete.cases(filedata)
    pure_data <- filedata[cmpl,]
    res <- append(res, cor(pure_data[['sulfate']], pure_data[['nitrate']]))
  }
  res
}