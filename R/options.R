#' @rdname jd3_utilities
#' @export
.jd3_env <- new.env()

#' @title Set an option for toolkit
#'
#' @param name Name of the option
#' @param obj Option
#'
#' @export
#'
#' @examples
#' toolkit_option("test", "DUMMY")
toolkit_option <- function(name, obj) {
    options <- .jd3_env$toolkit
    options[[name]] <- obj
    assign("toolkit", options, .jd3_env)
    return(invisible(NULL))
}

#' @title Set an option for toolkit
#'
#' @param name Name of the option
#'
#' @returns The requested option or NULL if it doesn't exist
#' @export
#'
#' @examples
#' toolkit_option("test", "DUMMY")
#' get_toolkit_option("test")
get_toolkit_option <- function(name) {
    options <- .jd3_env$toolkit
    return(options[[name]])
}
