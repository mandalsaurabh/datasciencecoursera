complete <- function(directory, id = 1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files

        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used

        ## Return a data frame of the form:
        ## id nobs
        ## 1 117
        ## 2 1041
        ## ...
        ## where 'id' is the monitor ID number and 'nobs' is the
        ## number of complete cases
        source('getMonitor.R')
        total_rows = length(id)
        results <- data.frame(id=rep(NA, total_rows), nobs=rep(0, total_rows))
        for(i in 1:total_rows){
            data <- getmonitor(id[i], directory)
            good <- complete.cases(data)
            results[i, ] <- c(id[i], sum(good))
        }
        results
}
