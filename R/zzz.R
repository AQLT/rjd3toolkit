#' @include utils.R
#' @importFrom RProtoBuf read readProtoFiles2
#' @importFrom rJava .jpackage .jcall .jnull .jarray .jevalArray .jcast .jcastToArray .jinstanceof is.jnull .jnew .jclass .jinit
#' @importFrom stats frequency is.ts pf ts ts.union
#' @importFrom rjd3jars initialize_protos
NULL

#' @rdname jd3_utilities
#' @export
get_java_version <- function() {
    jversion <- .jcall("java.lang.System", "S", "getProperty", "java.version")
    jversion <- as.integer(regmatches(jversion, regexpr(pattern = "^(\\d+)", text = jversion)))
    return(jversion)
}

#' @rdname jd3_utilities
#' @export
current_java_version <- 0

#' @rdname jd3_utilities
#' @export
minimal_java_version <- 21


#' Check the version of Java
#'
#' @param silent Display or not a message
#' @param startup Startup message
#'
#' @export
#'
#' @examples
#' check_java_version()
check_java_version <- function(silent = TRUE, startup = TRUE) {
    if (current_java_version < minimal_java_version) {
        if (!silent) {
            if (startup)
                packageStartupMessage(
                    sprintf(
                        "Your java version is %s. %s or higher is needed.",
                        current_java_version,
                        minimal_java_version
                    ))
            else
                message(
                    sprintf(
                        "Your java version is %s. %s or higher is needed.",
                        current_java_version,
                        minimal_java_version
                    ))
        }
        return (FALSE)
    } else
        return (TRUE)
}

.onLoad <- function(libname, pkgname) {
    result <- .jpackage(pkgname, lib.loc = libname)
    if (!result) stop("Loading java packages failed")
    current_java_version <<- get_java_version()

    if (is.null(getOption("summary_info"))) {
        options(summary_info = TRUE)
    }

    check_java_version(FALSE)

    rjd3jars::initialize_protos()
}

#' @rdname jd3_utilities
get_date_min <- function() {
    return(dateOf(1, 1, 1))
}

#' @rdname jd3_utilities
get_date_max <- function() {
    return(dateOf(9999, 12, 31))
}
