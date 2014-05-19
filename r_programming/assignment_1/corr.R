corr <- function(directory, threshold = 0) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files

        ## 'threshold' is a numeric vector of length 1 indicating the
        ## number of completely observed observations (on all
        ## variables) required to compute the correlation between
        ## nitrate and sulfate; the default is 0

        ## Return a numeric vector of correlations

        # Get the ids and what's complete for directory
        source('complete.R')

        getcor <- function(row){
            if(row[2] > threshold){
                data <- getmonitor(row[1], directory)
                cor(data[c(2,3)], use="complete.obs")[1,2]
            }
        }

        comp <- complete(directory)
        allcors <- apply(comp, 1, getcor)
        append(vector(mode="numeric"), unlist(allcors))
}
