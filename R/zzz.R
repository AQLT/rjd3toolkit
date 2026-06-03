#' @include utils.R
NULL

#' @importFrom RProtoBuf read readProtoFiles2
#' @importFrom rJava .jpackage .jcall .jnull .jarray .jevalArray .jcast .jcastToArray .jinstanceof is.jnull .jnew .jclass .jinit
#' @importFrom stats frequency is.ts pf ts ts.union
NULL

#' @rdname jd3_utilities
#' @importFrom rjd3jars get_java_version
#' @export
get_java_version <- rjd3jars::get_java_version

#' @rdname jd3_utilities
#' @importFrom rjd3jars get_java_version
#' @export
current_java_version <- rjd3jars::get_java_version()

#' @rdname jd3_utilities
#' @importFrom rjd3jars minimal_java_version
#' @export
minimal_java_version <- rjd3jars::minimal_java_version

.onAttach <- function(libname, pkgname) {
    .current_java_version <- get_java_version()
    if (.current_java_version < minimal_java_version) {
        packageStartupMessage(sprintf("Your java version is %s. %s or higher is needed.",
                                      .current_java_version, minimal_java_version))
    }
}

#' @importFrom RProtoBuf readProtoFiles2
#' @importFrom rJava .jpackage .jaddClassPath
.onLoad <- function(libname, pkgname) {
    jar_dir <- file.path(libname, pkgname, "inst", "java")
    jars <- list.files(jar_dir, pattern = "\\.jar$", full.names = TRUE, all.files = TRUE)
    rJava::.jaddClassPath(jars)
    result <- rJava::.jpackage(pkgname, lib.loc = libname)
    if (!result) stop("Loading java packages failed", call. = FALSE)

    proto.dir <- system.file("proto", package = pkgname)
    RProtoBuf::readProtoFiles2(protoPath = proto.dir)

    if (is.null(getOption("summary_info"))) {
        options(summary_info = TRUE)
    }
}

#' @rdname jd3_utilities
get_date_min <- function() {
    return(dateOf(1, 1, 1))
}

#' @rdname jd3_utilities
get_date_max <- function() {
    return(dateOf(9999, 12, 31))
}
