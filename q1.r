airdata <- read.csv("Airbnb_Q1.csv", header = TRUE)


hist(
  airdata$price,
  main = "Distribution of Price",
  xlab = "Price",
  ylim = c(0, 2500),
  breaks = 50,
)
#
# # Get quartiles for airdata$price
# quartiles <- quantile(airdata$price, probs = c(0.25, 0.5, 0.75))
#
# # Print quartiles
# cat("First Quartile: ", quartiles[1], "\n")
# cat("Second Quartile (Median): ", quartiles[2], "\n")
# cat("Third Quartile: ", quartiles[3], "\n")
#
# Create a boxplot of price by room type
boxplot(price ~ room_type, data = airdata, main = "Distribution of Price by Room Type", xlab = "Room Type", ylab = "Price")
