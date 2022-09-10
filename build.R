# Build File
#
# Documents the package using roxygen


# update documentation
devtools::document()

# install
devtools::install(
    dependencies = FALSE,
    keep_source=TRUE,
    args=c("--no-byte-compile", "--no-staged-install")
)
