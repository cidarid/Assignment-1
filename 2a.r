# Load the dataset
nbadata <- read.csv("nba_draft_combine_all_years.csv", header = TRUE)

# Load the necessary libraries
library(ggplot2)

# Relationship with Draft Pick
correlation_draft <- cor(nbadata$height_no_shoes, nbadata$draft_pick)
plot1 <- ggplot(nbadata, aes(x = draft_pick, y = height_no_shoes)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE, color = "blue") +
  labs(
    title = "Relationship between Height and Draft Pick",
    x = "Draft Pick",
    y = "Height (in inches)"
  ) +
  theme_minimal()

# Relationship with Wingspan
correlation_wingspan <- cor(nbadata$height_no_shoes, nbadata$wingspan)
plot2 <- ggplot(nbadata, aes(x = wingspan, y = height_no_shoes)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE, color = "green") +
  labs(
    title = "Relationship between Height and Wingspan",
    x = "Wingspan (in inches)",
    y = "Height (in inches)"
  ) +
  theme_minimal()

# Relationship with Vertical Max
correlation_vertical <- cor(nbadata$height_no_shoes, nbadata$vertical_max)
plot3 <- ggplot(nbadata, aes(x = vertical_max, y = height_no_shoes)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE, color = "red") +
  labs(
    title = "Relationship between Height and Vertical Max",
    x = "Vertical Max (in inches)",
    y = "Height (in inches)"
  ) +
  theme_minimal()

# Print correlation coefficients
cat("Correlation with Draft Pick:", correlation_draft, "\n")
cat("Correlation with Wingspan:", correlation_wingspan, "\n")
cat("Correlation with Vertical Max:", correlation_vertical, "\n")

# Show the plots
# print(plot1)
# print(plot2)
print(plot3)
