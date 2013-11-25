#' Write R output to file with date and time appended to filename
#'
#' @export
#' @param prefix an optional prefix used to use in naming sink log file
#' @examples
#' #TODO: Add examples
logOutput <- function(prefix='') {
    if (sink.number() > 0 && prefix == '') {
        # If already have a sink, stop last sink
        sink()
        message('Stopped sink')
    } else {
        filesuffix <- paste0(format(Sys.time(), '%Y%m%d-%H%M%S'), '.log')
        if (prefix == '') {
            sinkfile <- paste0('Rsink_', filesuffix)
        } else {
            sinkfile <- paste(prefix, filesuffix, sep='_')
        }
        message(paste('Redirecting output to', sinkfile))
        sink(sinkfile)
    }
}
