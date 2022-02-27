#' @export
export_stl <- function(
  input_matrix,
  filename = "~/bbox_output.stl",
  scaling = 2
) {
  
  max_dim <- min(dim(input_matrix)) - 1
  
  stl_data <- reshape2::melt(
    input_matrix[1:max_dim, c(1:max_dim, ncol(input_matrix))],
    id.vars = c("deg_elmat_lat")
  ) %>% setNames(
    c("y",
    "x",
    "z")
  )
  
  stl_data$x <- as.numeric(as.character(stl_data$x))
  stl_data$y <- 180 - stl_data$y
  stl_data$z <- scaling * stl_data$z
  
  stl_data <- stl_data[order(stl_data$x, stl_data$y), ]
  
  rgl::persp3d(
    x = unique(stl_data$x),
    y = unique(stl_data$y),
    z = stl_data$z,
    color="magenta"
  )
  rgl::writeSTL(filename, pointRadius = 0.00004, lineSides = 50)

}
