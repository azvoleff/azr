#' Print status messages tracking run time for an R script
#'
#' @export
#' @param action a string indicating whether to \code{start} the timer or 
#' \code{print} (default) the time that has passed since the timer was last 
#' started.
#' @examples
#' #TODO: Add examples
trackTime <- function(action='print') {
    if (action == 'start') {
        assign('trackTime_timing', proc.time(), inherits=TRUE)
        print('Reset tracking timer')
    } else if (action == 'print') {
        if (exists("trackTime_timing")) {
            print(proc.time() - trackTime_timing)
        } else {
            stop('Must call trackTime("start") before calling trackTime()')
        }
    } else {
        stop(paste('Unrecognized action "', action, '"', sep=''))
    }
}
