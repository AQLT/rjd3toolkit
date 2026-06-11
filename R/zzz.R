#' @include utils.R
#' @importFrom rJava .jpackage .jcall .jnull .jarray .jevalArray .jcast .jcastToArray .jinstanceof is.jnull .jnew .jclass .jinit
#' @importFrom stats frequency is.ts pf ts ts.union
#' @importFrom rjd3jars reload_dictionaries check_java_version
NULL

#' @rdname jd3_utilities
#' @export
.jd3_env <- new.env()

.onLoad <- function(libname, pkgname) {
    result <- .jpackage(pkgname, lib.loc = libname)
    if (!result)
        stop("Loading java packages failed")

    if (is.null(getOption("summary_info"))) {
        options(summary_info = TRUE)
    }

    if (rjd3jars::check_java_version(FALSE)) {
        rjd3jars::reload_dictionaries()
    }

    proto_dir <- system.file("proto", package = pkgname)
    readProtoFiles2(protoPath = proto_dir)

    assign("toolkit", list(), .jd3_env)
}

#' Set an option for toolkit
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
    assign("toolkit", options, rjd3toolkit::.jd3_env)
    invisible()
}

#' Set an option for toolkit
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
    return (options[[name]])
}


#' @rdname jd3_utilities
get_date_min <- function() {
    return(dateOf(1, 1, 1))
}

#' @rdname jd3_utilities
get_date_max <- function() {
    return(dateOf(9999, 12, 31))
}
