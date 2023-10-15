# Fit a least squares regression model
reg_model_vertical <- lm(vertical_max ~ height_no_shoes, data = nbadata)

# Get the regression coefficients
intercept_vertical <- coef(reg_model_vertical)[1]
slope_vertical <- coef(reg_model_vertical)[2]

# Print the regression equation
cat("Regression Equation: Vertical Max =", round(intercept_vertical, 2), "+", round(slope_vertical, 2), "x Height\n")

# Create a scatterplot with the regression line
plot_reg_vertical <- ggplot(nbadata, aes(x = height_no_shoes, y = vertical_max)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE, color = "blue") +
  labs(
    title = "Scatterplot of Vertical Max vs. Height",
    x = "Height (in inches)",
    y = "Vertical Max (in inches)"
  ) +
  theme_minimal()

# Show the plot
print(plot_reg_vertical)

# Predict Vertical Max for a player who is 80 inches tall
predicted_vertical_max_80 <- predict(reg_model_vertical, newdata = data.frame(height_no_shoes = 80))

# Predict Vertical Max for a player who is 100 inches tall
predicted_vertical_max_100 <- predict(reg_model_vertical, newdata = data.frame(height_no_shoes = 100))

cat("Predicted Vertical Max for a player who is 80 inches tall:", round(predicted_vertical_max_80, 2), "\n")
cat("Predicted Vertical Max for a player who is 100 inches tall:", round(predicted_vertical_max_100, 2), "\n")
