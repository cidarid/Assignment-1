# Fit a least squares regression model
reg_model_wingspan <- lm(wingspan ~ height_no_shoes, data = nbadata)

# Get the regression coefficients
intercept_wingspan <- coef(reg_model_wingspan)[1]
slope_wingspan <- coef(reg_model_wingspan)[2]

# Print the regression equation
cat("Regression Equation: Wingspan =", round(intercept_wingspan, 2), "+", round(slope_wingspan, 2), "x Height\n")

# Create a scatterplot with the regression line
plot_reg_wingspan <- ggplot(nbadata, aes(x = height_no_shoes, y = wingspan)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE, color = "blue") +
  labs(
    title = "Scatterplot of Wingspan vs. Height",
    x = "Height (in inches)",
    y = "Wingspan (in inches)"
  ) +
  theme_minimal()

# Create residual plots
residuals_wingspan <- resid(reg_model_wingspan)
plot_residuals_wingspan <- ggplot(data.frame(Residuals = residuals_wingspan), aes(x = Residuals)) +
  geom_histogram(fill = "lightblue", color = "black") +
  labs(
    title = "Residual Plot for Wingspan",
    x = "Residuals",
    y = "Frequency"
  ) +
  theme_minimal()

# Show the plots
print(plot_reg_wingspan)
# print(plot_residuals_wingspan)

# Fit a least squares regression model
reg_model_wingspan <- lm(wingspan ~ height_no_shoes, data = nbadata)

# Get the summary statistics
summary_reg_wingspan <- summary(reg_model_wingspan)

# Extract R-squared value and p-value for the slope
r_squared_wingspan <- summary_reg_wingspan$r.squared
p_value_wingspan <- summary_reg_wingspan$coefficients[2, 4]

# Print the R-squared value and p-value
cat("R-squared for Wingspan vs. Height:", round(r_squared_wingspan, 4), "\n")
cat("P-value for the slope (Wingspan vs. Height):", format.pval(p_value_wingspan), "\n")
