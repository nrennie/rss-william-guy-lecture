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
rss_blue <- "#005573"
rss_yellow <- "#d3a435"

body_font <- "source"
title_font <- "source"


# Start recording ---------------------------------------------------------

gg_record(
  dir = file.path("images", "recording"),
  device = "png",
  width = 6,
  height = 4,
  units = "in",
  dpi = 300)

  
# Plot 1 ------------------------------------------------------------------

set.seed(12345)
plot_data1 <- data.frame(
  change = c(rnorm(50, 3, 1))
)
ggplot(plot_data1) +
  geom_density(mapping = aes(x = change),
               colour = rss_blue,
               fill = rss_blue,
               alpha = 0.3) +
  geom_vline(xintercept = 0,
             colour = "#A4243B",
             linewidth = 0.5) +
  labs(
    x = "Change in systolic blood pressure (mmHg)",
    y = ""
  ) +
  scale_x_continuous(limits = c(-6, 6), expand = expansion(0, 0)) +
  theme_minimal(base_size = 32, base_family = body_font) +
  theme(axis.text.y = element_blank(),
        axis.ticks = element_blank(),
        plot.background = element_rect(
          fill = "transparent", colour = "transparent"),
        panel.background = element_rect(
          fill = "transparent", colour = "transparent"))

ggsave("images/density1.png", width = 6, height = 4, bg = "transparent")

# Plot 2 ------------------------------------------------------------------

set.seed(12345)
plot_data2 <- data.frame(
  change = c(rnorm(25, 4, 0.7), rnorm(25, 0.1, 0.7)),
  type = c(rep("New treatment", 25), rep("Current treatment", 25))
)
ggplot(plot_data2) +
  geom_density(mapping = aes(x = change, colour = type, fill = type),
               alpha = 0.3) +
  scale_fill_manual(
    values = c(rss_blue, rss_yellow)
  ) +
  scale_colour_manual(
    values = c(rss_blue, rss_yellow)
  ) +
  labs(
    x = "Change in systolic blood pressure (mmHg)",
    y = ""
  ) +
  scale_x_continuous(limits = c(-6, 6), expand = expansion(0, 0)) +
  theme_minimal(base_size = 32, base_family = body_font) +
  theme(axis.text.y = element_blank(),
        legend.title = element_blank(),
        legend.position = "inside",
        legend.position.inside = c(0.2, 0.85),
        axis.ticks = element_blank(),
        plot.background = element_rect(
          fill = "transparent", colour = "transparent"),
        panel.background = element_rect(
          fill = "transparent", colour = "transparent"))

ggsave("images/density2.png", width = 6, height = 4, bg = "transparent")



# Plot 3 ------------------------------------------------------------------

set.seed(12345)
plot_data3 <- data.frame(
  change = c(rnorm(25, 3.5, 1), rnorm(25, 2.5, 1)),
  type = c(rep("New treatment", 25), rep("Current treatment", 25))
)
ggplot(plot_data2) +
  geom_density(mapping = aes(x = change, colour = type, fill = type),
               alpha = 0.3) +
  scale_fill_manual(
    values = c(rss_blue, rss_yellow)
  ) +
  scale_colour_manual(
    values = c(rss_blue, rss_yellow)
  ) +
  labs(
    x = "Change in systolic blood pressure (mmHg)",
    y = ""
  ) +
  scale_x_continuous(limits = c(-6, 6), expand = expansion(0, 0)) +
  theme_minimal(base_size = 32, base_family = body_font) +
  theme(axis.text.y = element_blank(),
        legend.title = element_blank(),
        legend.position = "inside",
        legend.position.inside = c(0.2, 0.85),
        axis.ticks = element_blank(),
        plot.background = element_rect(
          fill = "transparent", colour = "transparent"),
        panel.background = element_rect(
          fill = "transparent", colour = "transparent"))

ggsave("images/density3.png", width = 6, height = 4, bg = "transparent")









