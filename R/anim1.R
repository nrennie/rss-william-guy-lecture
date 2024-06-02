# Load packages -----------------------------------------------------------

library(tidyverse)
library(showtext)
library(camcorder)
library(ggtext)
library(glue)


# Load fonts --------------------------------------------------------------

font_add_google("Source Sans 3", "source")
showtext_auto()

sysfonts::font_add(family = "Font Awesome 6 Solid",
                   regular = "fonts/Font Awesome 6 Free-Solid-900.otf")
showtext::showtext_auto()


# Define colours and fonts-------------------------------------------------

bg_col <- "transparent"
text_col <- "black"
col1 <- "#00c4aa"
col2 <- "#8700f9"

body_font <- "source"
title_font <- "source"


# Data wrangling ----------------------------------------------------------

set.seed(1234)
n <- 30
plot_data <- data.frame(
  t = 1:n,
  x = runif(n),
  y = runif(n),
  gen = sample(c("M", "F"), n, replace = T),
  treatment = factor(sample(c(
    "Treatment A", "Treatment B"
  ), n, replace = T), levels = c("Treatment A", "Treatment B"))
)

# plot function
plot_time_t <- function(time_t) {
  g <- ggplot(filter(plot_data, t <= time_t)) +
    geom_textbox(
      mapping = aes(x = x, y = y, colour = gen,
                    label = "<span style='font-family:\"Font Awesome 6 Solid\";'>&#xf183;</span>"),
      box.colour = NA,
      fill = NA,
      hjust = 0.5,
      halign = 0.5,
      lineheight = 0.5,
      vjust = 1,
      size = 18
    ) +
    facet_wrap(~treatment, drop = FALSE) +
    scale_colour_manual(
      values = c("M" = col1, "F" = col2)
    ) +
    scale_x_continuous(limits = c(0, 1)) +
    scale_y_continuous(limits = c(0, 1)) +
    theme_void(
      base_family = body_font,
      base_size = 28
    ) +
    theme(
      plot.margin = margin(10, 10, 10, 10),
      strip.text = element_text(size = 30,
                                margin = margin(5, 2, 5, 2)),
      strip.background = element_rect(
        fill = NA, colour = text_col
      ),
      legend.position = "none",
      panel.border = element_rect(
        colour = text_col, fill = NA
      )
    )
  return(g)
}

plot_time_t(t = 3)


# Start recording ---------------------------------------------------------

gg_record(
  dir = file.path("images", "anim1", "recording"),
  device = "png",
  width = 6,
  height = 4,
  units = "in",
  dpi = 300
)

for (i in 1:n) {
  g = plot_time_t(t = i)
  print(g)
}

# Save gif ----------------------------------------------------------------

gg_playback(
  name = file.path("images", "anim1.gif"),
  first_image_duration = 4,
  last_image_duration = 20,
  frame_duration = .25,
  background = bg_col,
  last_as_first = FALSE,
  image_resize = 900
)
