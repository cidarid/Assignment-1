# Fit a least squares regression model
reg_model <- lm(draft_pick ~ height_no_shoes, data = nbadata)

# Get the regression coefficients
intercept <- coef(reg_model)[1]
slope <- coef(reg_model)[2]

# Print the regression equation
cat("Regression Equation: Draft Pick =", round(intercept, 2), "+", round(slope, 2), "x Height\n")

# Create a scatterplot with the regression line
plot_reg <- ggplot(nbadata, aes(x = height_no_shoes, y = draft_pick)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE, color = "blue") +
  labs(
    title = "Scatterplot of Draft Pick vs. Height",
    x = "Height (in inches)",
    y = "Draft Pick"
  ) +
  theme_minimal()

# Create residual plots
residuals <- resid(reg_model)
plot_residuals <- ggplot(data.frame(Residuals = residuals), aes(x = Residuals)) +
  geom_histogram(fill = "lightblue", color = "black") +
  labs(
    title = "Residual Plot",
    x = "Residuals",
    y = "Frequency"
  ) +
  theme_minimal()

# Show the plots
print(plot_reg)
# print(plot_residuals)

# Fit a least squares regression model
reg_model <- lm(draft_pick ~ height_no_shoes, data = nbadata)

# Get the summary statistics
summary_reg <- summary(reg_model)

# Extract R-squared value and p-value for the slope
r_squared <- summary_reg$r.squared
p_value <- summary_reg$coefficients[2, 4]

# Print the R-squared value and p-value
cat("R-squared:", round(r_squared, 4), "\n")
cat("P-value (Slope):", format.pval(p_value), "\n")
