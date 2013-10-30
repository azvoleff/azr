#' Sort output from summaryRprof
#'
#' @export
#' @param Rprof_file an output file from Rprof
#' @param type a string indicating whether to output \code{total} or 
#' \code{self} time
#' @examples
#' #TODO: Add examples
sortRprofTime <- function(Rprof_file, type='total') {
    summ <- summaryRprof(Rprof_file)
    summ <- summ[[grep(paste('by', type, sep='.'), names(summ))]]
    time_col <- grep(paste(type, 'time', sep='.'), names(summ))
    summ[order(summ[time_col], decreasing=TRUE), ]
}
