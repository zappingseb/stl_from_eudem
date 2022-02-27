#' Paste a string from bbox finder
#' 
#' @export
#' @import magrittr
parse_bbox_finder <- function(x) {
  split_str <- strsplit(x, split = ",")[[1]]
  return(cbind(
    c(
      as.numeric(split_str[1]),
      as.numeric(split_str[2])
    ),
    c(
      as.numeric(split_str[3]),
                 as.numeric(split_str[4])
    )
  ))
}
