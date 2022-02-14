#' make_plot 
#'
#' @description A fct function
#'
#' @return The return value, if any, from executing the function.
#'
#' @noRd



sysfonts::font_add_google("Marck Script", "custom")

showtext::showtext_auto()

generate_rectangle <- function(x, y, height, width, group = 1, p) {
  data.frame(x = c(x, x + width, x + width, x),
             y = c(y, y, y + height, y + height),
             group = rep(group, 4),
             col = as.character(rep(sample(1:13, size = 1, prob = p), 4)))
}




make_plot <- function(n = 100,
                       max_height = 7,
                       max_width = 5,
                       size = 1,
                       main_col = "lightgrey",
                       col_palette = "Pastel",
                       bg_col = "white",
                       caption = " ",
                       caption_font_size = 15,
                       caption_col = "red",
                       p = c(rep(0.03, 12), 0.64),
                       s = 123) {
  if (max_height <= 2 | max_width <= 2) {
    stop("height and width should be > 2")
  }
  # generate data
  #set.seed(s)
  plot_data <- data.frame(x = c(),
                          y = c(),
                          group = c(),
                          col = c())
  for (i in 1:n) {
    k <- generate_rectangle(x = stats::runif(1, 0, 30),
                            y = stats::runif(1, 0, 30),
                            height = stats::runif(1, 2, max_height),
                            width = stats::runif(1, 2, max_width),
                            group = i,
                            p)
    plot_data <- rbind(plot_data, k)
  }
  # set colours
  pal <- c(rcartocolor::carto_pal(12, col_palette), main_col)
  names(pal) <- 1:13
  # plot
  p <- ggplot2::ggplot(plot_data, ggplot2::aes(x = .data$x, y = .data$y)) +
    ggplot2::geom_polygon(ggplot2::aes(group = .data$group,
                                       colour = .data$col),
                          fill = "transparent",
                          size = size) +
    ggplot2::scale_colour_manual(values = pal) +
    ggplot2::coord_fixed() +
    ggplot2::theme_void() +
    ggplot2::xlim((min(c(plot_data$x, plot_data$y))), (max(c(plot_data$x, plot_data$y)))) +
    ggplot2::ylim((min(c(plot_data$x, plot_data$y))), (max(c(plot_data$x, plot_data$y)))) +
    ggplot2::theme(legend.position = "none",
                   panel.background = ggplot2::element_rect(fill = bg_col, colour = bg_col),
                   plot.background = ggplot2::element_rect(fill = bg_col, colour = bg_col),
                   plot.caption = ggplot2::element_text(color = caption_col, family = "custom", size = caption_font_size, margin = ggplot2::margin(20, 0, 20, 0), hjust = 0.5),
    ) +
    ggplot2::labs(caption = caption)
  p
}
