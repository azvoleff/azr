#' Print status messages tracking run time for an R script
#'
#' @export
#' @import lubridate
#' @param an optional label used to maintain multiple tracking timers
#' @param action a string indicating whether to \code{start} the timer or 
#' \code{print} (default) the time that has passed since the timer was last 
#' started.
#' @examples
#' #TODO: Add examples
trackTime <- function(label='', action='print') {
    if (action == 'start') {
        assign(paste('trackTime_starttime', label, sep='_'), now(), 
               inherits=TRUE)
        message('trackTime: Tracking timer reset.')
    } else if (action == 'print') {
        startTimeVar <- mget(paste('trackTime_starttime', label, sep='_'), 
                             ifnotfound=list(NULL), inherits=TRUE)
        if (!is.null(startTimeVar[[1]])) {
            if (label != '') {
                message(paste0('trackTime (', label, '): ', round(as.duration(now() - startTimeVar[[1]]), 2)))
            } else {
                message(paste('trackTime:', round(as.duration(now() - startTimeVar[[1]]), 2)))
            }
        } else {
            stop(paste0('No timer with label "', label, '" found. Must call 
                        trackTime("start") before calling trackTime()'))
        }
    } else {
        stop(paste('Unrecognized action "', action, '"', sep=''))
    }
}
