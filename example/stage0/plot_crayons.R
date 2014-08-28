# Plot to illustrate crayon colors
plot_crayons <-
function(method2order=c("hsv", "cluster"), cex=0.6, mar=rep(0.1, 4))
{
  method2order <- match.arg(method2order)

  crayons <- brocolors("crayons")

  # get rgb
  colval <- col2rgb(crayons)

  if(method2order == "hsv") {
    # convert to hsv
    colval <- t(rgb2hsv(colval))

    # order the colors; first two lines are to get black/gray/silver/white first
    ord <- order(names(crayons)!="Black", names(crayons)!="Gray",
                 names(crayons)!="Silver", names(crayons)!="White",
                 colval[,1], colval[,2], colval[,3])

  } else {
    ord <- hclust(dist(t(colval)))$ord
  }

  oldmar <- par("mar")
  on.exit(par(mar=oldmar))

  par(mar=mar)
  x <- (1:7)-1
  y <- (1:19)-1
  x <- rep(x, each=19)
  y <- rep(y, 7)

  plot(0, 0, type="n", xlab="", ylab="", xaxs="i", yaxs="i",
       xlim=c(0, max(x)+1), ylim=c(max(y)+0.5, -0.5),
       xaxt="n", yaxt="n")

  dx <- 0.2
  dy <- 0.4
  rect(x+dx/4, y-dy, x+dx, y+dy, border="black",
       col=crayons[ord])

  text(x+dx*1.2, y, names(crayons)[ord], cex=cex, adj=c(0, 0.5))
}
