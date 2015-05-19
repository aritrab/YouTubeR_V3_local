
data(tips, package="reshape")
pm <- ggpairs(tips[,1:3])
pm

pm <- ggpairs(tips)
pm
pm <- ggpairs(tips, upper = "blank")
pm


# Custom Example
pm <- ggpairs(
  tips[,1:4],
  upper = list(continuous = "density", combo = "box"),
  lower = list(continuous = "points", combo = "dot")
)
 pm

# Use sample of the diamonds data
data(diamonds, package="ggplot2")
diamonds.samp <- diamonds[sample(1:dim(diamonds)[1],200),]

# Custom Example
pm <- ggpairs(
  diamonds.samp[,1:3],
  upper = list(continuous = "density", combo = "box"),
  lower = list(continuous = "points", combo = "dot"),
  color = "cut",
  title = "Diamonds"
)
pm

# Will plot four "Incorrect Plots"
bad_plots <- ggpairs(
  tips[,1:3],
  upper = list(continuous = "wrongType1", combo = "wrongType2"),
  lower = list(continuous = "IDK1", combo = "IDK2", discrete = "mosaic"),
)
bad_plots

# Labels on the outside, grids won't line up
pm <- ggpairs(tips[,1:3], axisLabels="none")
pm

# Custom Examples
custom_car <- ggpairs(mtcars[,c("mpg","wt","cyl")], upper = "blank", title = "Custom Example")
# ggplot example taken from example(geom_text)
plot <- ggplot(mtcars, aes(x=wt, y=mpg, label=rownames(mtcars)))
plot <- plot + geom_text(aes(colour=factor(cyl)), size = 3) + scale_colour_discrete(l=40)
custom_car <- putPlot(custom_car, plot, 1, 2)
personal_plot <- ggally_text(
  "ggpairs allows you\nto put in your\nown plot.\nLike that one.\n <---"
)
custom_car <- putPlot(custom_car, personal_plot, 1, 3)
custom_car
