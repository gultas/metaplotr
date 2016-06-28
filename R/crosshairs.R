#'Creates a Cross-hairs Plot.
#'
#'When given effect sizes and standard errors, creates cross-hairs plots.
#'
#'\code{crosshairs}'s basic output is a bitmat file that contains cross-hairs
#'plot of given dependent effect sizes.
#'
#'@param x Numeric vector of effect sizes that will be used in x axis.
#'@param y Numeric vector of effect sizes that will be used in y axis.
#'@param xse Numeric vector standard errors of effect sizes that is used
#'       in x axis.
#'@param yse Numeric vector standard errors of the effect sizes that is used
#'       in y axis
#'@param x_lab Title of the x-axis.
#'@param y_lab Title of the y-axis.
#'@param mdrtr Whether there is a moderator variable?
#'@param mdrtr_lab Label of the moderator variable.
#'@param mdrtr_lab_pos Determine the positon of the moderator labels.
#'@param lab_size Size of the axis titles.
#'@param confint Confidence interval that is used to determine
#'       length of the whiskers.
#'@param main_lab Main label of the cross-hairs plot.
#'@param pnt_size Determines the size of point in the plot.
#'@param whis_on Whiskers on or off?
#'@param annotate If true, mean effect size and correlation between
#'       effect sizes will be printed within the graph.
#'@param grid_dense When changed to FALSE, a default denser gridlines
#'       will be used.
#'@param bxplts Swithes boxplots on or off.
#'
#'@return NULL
#'
#'@aliases cross-hairs
#'
#'@examples
#'# Load and attach metaplotr package to the Global Environment
#'library(metaplotr)
#'
#'# Remove all variables in the .GlobalEnv, effectively clearing .GlobalEvn
#'rm(list = ls())
#'
#'# Find out more about the data set from Ferguson and Brannick (2012)
#'# help("FergusonBrannick2012")
#'
#'# You can check out help file of the \code{crosshairs} function.
#'# help(crosshairs)
#'
#'# Basic usage of the \code{crosshairs} function.
#'crosshairs(FergusonBrannick2012$pub_z, FergusonBrannick2012$dis_z,
#'FergusonBrannick2012$pub_z_se, FergusonBrannick2012$dis_z_se)
#'
#'# whis_on option opens and closes whiskers.
#'crosshairs(FergusonBrannick2012$pub_z, FergusonBrannick2012$dis_z,
#'FergusonBrannick2012$pub_z_se, FergusonBrannick2012$dis_z_se,
#'whis_on = FALSE)
#'
#'# confint option can control whiskers length.
#'crosshairs(FergusonBrannick2012$pub_z, FergusonBrannick2012$dis_z,
#'FergusonBrannick2012$pub_z_se, FergusonBrannick2012$dis_z_se, confint = .95)
#'crosshairs(FergusonBrannick2012$pub_z, FergusonBrannick2012$dis_z,
#'FergusonBrannick2012$pub_z_se, FergusonBrannick2012$dis_z_se, confint = .7)
#'crosshairs(FergusonBrannick2012$pub_z, FergusonBrannick2012$dis_z,
#'FergusonBrannick2012$pub_z_se, FergusonBrannick2012$dis_z_se, confint = .2)
#'
#'# Main and axes labels can be changed.
#'crosshairs(FergusonBrannick2012$pub_z, FergusonBrannick2012$dis_z,
#'FergusonBrannick2012$pub_z_se, FergusonBrannick2012$dis_z_se,
#'main_lab = 'Different Main Label', x_lab = 'Different X Label',
#'y_lab = 'Different Y Label')
#'
#'# Annotated correlation and meand values can be added to the graph.
#'crosshairs(FergusonBrannick2012$pub_z, FergusonBrannick2012$dis_z,
#'FergusonBrannick2012$pub_z_se, FergusonBrannick2012$dis_z_se, annotate = TRUE,
#'main_lab = 'Annotated Graph')
#'
#'# Boxplots can be hidden.
#'crosshairs(FergusonBrannick2012$pub_z, FergusonBrannick2012$dis_z,
#'FergusonBrannick2012$pub_z_se, FergusonBrannick2012$dis_z_se,
#'main_lab = 'No Boxplots', bxplts = FALSE)
#'
#'# Moderator legend and annotations can be used simulaneously.
#'crosshairs(FergusonBrannick2012$pub_z, FergusonBrannick2012$dis_z,
#'FergusonBrannick2012$pub_z_se, FergusonBrannick2012$dis_z_se,
#'mdrtr = FergusonBrannick2012$mod, annotate = TRUE,
#'main_lab = 'Moderator Legend and Annotation')
#'
#'# Dot size can be changed.
#'crosshairs(FergusonBrannick2012$pub_z, FergusonBrannick2012$dis_z,
#'FergusonBrannick2012$pub_z_se, FergusonBrannick2012$dis_z_se,
#'mdrtr = FergusonBrannick2012$mod, pnt_size = 6,
#'main_lab = 'Bigger Dots')
#'
#'# Size of labels can be changed.
#'crosshairs(FergusonBrannick2012$pub_z, FergusonBrannick2012$dis_z,
#'FergusonBrannick2012$pub_z_se, FergusonBrannick2012$dis_z_se,
#'mdrtr = FergusonBrannick2012$mod, lab_size = 20,
#'main_lab = 'Label Size Change')
#'
#'@export
crosshairs <- function(x, y, xse, yse, x_lab = NULL, y_lab = NULL,
                       main_lab = NULL, confint = 0.95, mdrtr = NULL,
                       mdrtr_lab = NULL, mdrtr_lab_pos = NULL,
                       lab_size = 14, pnt_size = 3, whis_on = TRUE,
                       annotate = FALSE, grid_dense = FALSE, bxplts = TRUE) {

  # Default axis and main labels of the graph.
  if (is.null(x_lab)) {
    x_lab <- 'X Axis Title'
  }

  if (is.null(y_lab)) {
    y_lab <- 'Y Axis Title'
  }

  if (is.null(main_lab)) {
    main_lab <- 'Main Title of the Plot'
  }

  # When a moderator variable is specified
  if (!is.null(mdrtr)) {

    if (!is.factor(mdrtr)) {
      # A factor is required as a moderator
      mdrtr <- as.factor(mdrtr)
    }

    # Determines moderator label position
    if (is.null(mdrtr_lab_pos)) {
      modrtr_xpos <- 0.2
      modrtr_ypos <- 0.9
    }

    # Moderator legend position vector
    legend_pst <- c(modrtr_xpos, modrtr_ypos)

    if (is.null(mdrtr_lab)) {
      mdrtr_lab <- 'Mod Label'
    }
  }

  # Assign formals to previous variables. To be modified.
  se.x <- xse
  se.y <- yse

  # Calculating upper and lower limits of effect sizes for whiskers.
  xll <- x - stats::qnorm(1 - (1 - confint) / 2) * se.x
  xul <- x + stats::qnorm(1 - (1 - confint) / 2) * se.x
  yll <- y - stats::qnorm(1 - (1 - confint) / 2) * se.y
  yul <- y + stats::qnorm(1 - (1 - confint) / 2) * se.y

  # Creating data frame that will be used by ggplot2 package.
  if (!is.null(mdrtr)) {
    graph.data <- data.frame(
      x = x,
      se.x = se.x,
      y = y,
      se.y = se.y,
      xll = xll,
      xul = xul,
      yul = yul,
      yll = yll,
      mod = mdrtr
    )
    mdrtr_split <- strsplit(mdrtr_lab, ' ')
    mdrtr_lab <- paste(mdrtr_split[[1]], collapse = '\n')
  } else {
    graph.data <- data.frame(
      x = x,
      se.x = se.x,
      y = y,
      se.y = se.y,
      xll = xll,
      xul = xul,
      yul = yul,
      yll = yll
    )
  }

  # Creating bitmap file in working directory.
  # grDevices::tiff(filename = paste(file_name, ".tiff", sep = ''),
  #                 width = file_dim[1], height = file_dim[2],
  #                 units = "px", pointsize = 12)

  # Finding maximum and minimum values of axes for grid creating purpose.
  find.min.max <- function(xll, xul, yll, yul) {
    x.min <- min(xll, xul)
    x.min <- x.min - 0.1
    y.min <- min(yll, yul)
    y.min <- y.min - 0.1
    x.range <- max(xll, xul) - min(xll, xul)
    y.range <- max(yll, yul) - min(yll, yul)
    b.range <- x.range
    if (b.range >= y.range) {
      b.range
    } else {
      b.range <- y.range
    }
    x.max <- x.min + b.range + (b.range / 5)
    y.max <- y.min + b.range + (b.range / 5)
    x <- c(x.min = x.min,
           x.max = x.max,
           y.min = y.min,
           y.max = y.max)
    return(x)
  }

  # One of the plots is blank.
  blank.plot <- ggplot2::ggplot() +
    ggplot2::geom_blank(ggplot2::aes(1,1)) +
    ggplot2::theme(
      plot.background = ggplot2::element_blank(),
      panel.grid.major = ggplot2::element_blank(),
      panel.grid.minor = ggplot2::element_blank(),
      panel.border = ggplot2::element_blank(),
      panel.background = ggplot2::element_blank(),
      axis.title.x = ggplot2::element_blank(),
      axis.title.y = ggplot2::element_blank(),
      axis.text.x = ggplot2::element_blank(),
      axis.text.y = ggplot2::element_blank(),
      axis.ticks = ggplot2::element_blank()
    )

  axis.scale <- with(graph.data,
                     find.min.max(xll, xul,
                                  yll, yul))

  # Open and close whiskers.
  if (whis_on) {
  main.plot <- ggplot2::ggplot(graph.data,
                               ggplot2::aes(x = x, y = y)) +
    ggplot2::geom_abline(intercept = 0,
                  slope = 1,
                  size = .5,
                  linetype = 'solid',
                  alpha = 0.3) +
    ggplot2::geom_hline(yintercept = 0,
               linetype = 'solid',
               size = 0.5,
               alpha = 0.5,
               color = 'firebrick') +
    ggplot2::geom_vline(xintercept = 0,
               linetype = 'solid',
               size = 0.5,
               alpha = 0.5,
               color = 'firebrick') +
    ggplot2::geom_errorbar(ggplot2::aes(ymin = yll,
                      ymax = yul),
                  color = 'gray10',
                  size = 0.5,
                  alpha = 1) +
    ggplot2::geom_errorbarh(ggplot2::aes(xmin = xll,
                       xmax = xul),
                   size = 0.5,
                   color = 'gray10',
                   alpha = 1)
  } else {
    main.plot <- ggplot2::ggplot(graph.data,
                                 ggplot2::aes(x = x, y = y)) +
      ggplot2::geom_abline(intercept = 0,
                    slope = 1,
                    size = .5,
                    linetype = 'solid',
                    alpha = 0.3) +
      ggplot2::geom_hline(yintercept = 0,
                 linetype = 'solid',
                 size = 0.5,
                 alpha = 0.5,
                 color = 'firebrick') +
      ggplot2::geom_vline(xintercept = 0,
                 linetype = 'solid',
                 size = 0.5,
                 alpha = 0.5,
                 color = 'firebrick')
  }

  if (!is.null(mdrtr)) {
    main.plot <- main.plot +
    ggplot2::geom_point(ggplot2::aes(shape = mdrtr, colour = mdrtr),
               size = ggplot2::rel(pnt_size)) +
    ggplot2::scale_color_discrete(
      name = mdrtr_lab,
      breaks = levels(graph.data$mod),
      labels = levels(graph.data$mod)
    ) +
    ggplot2::scale_shape_discrete(
      name = mdrtr_lab,
      breaks = levels(graph.data$mod),
      labels = levels(graph.data$mod)
    )
    main.plot
  } else {
    main.plot <- main.plot +
      ggplot2::geom_point(color = 'coral',
                          size = ggplot2::rel(pnt_size))
    main.plot
  }

  ##############################################################################
  main.plot <- main.plot +
    ggplot2::coord_cartesian(xlim = c(axis.scale[1], axis.scale[2]),
                             ylim = c(axis.scale[3], axis.scale[4]))

  # Created denser gridlines
  if (grid_dense) {
    main.plot <- main.plot +
      ggplot2::scale_x_continuous(breaks = round(seq(axis.scale[1],
                                                     axis.scale[2],
                                                     by = 0.2), 1)) +
      ggplot2::scale_y_continuous(breaks = round(seq(axis.scale[3],
                                                     axis.scale[4],
                                                     by = 0.2), 1))
    main.plot
  }

  main.plot <- main.plot +
    ggplot2::xlab(x_lab) +
    ggplot2::ylab(y_lab) +
    ggplot2::theme_light() +
    ggplot2::theme(
      axis.title = ggplot2::element_text(size = lab_size)
    )

  # Adding moderator label to the graph if there is a moderator.
  if (!is.null(mdrtr)) {
    main.plot <- main.plot +
    ggplot2::theme(
      legend.position = legend_pst,
      legend.justification = c(0.5, 0.5),
      panel.grid.minor = ggplot2::element_blank(),
      axis.title = ggplot2::element_text(size = lab_size)
      )
    main.plot
  }

  # Boxplot on the left.
  dis.boxplot <- ggplot2::ggplot(graph.data, ggplot2::aes(factor(1), y)) +
    ggplot2::geom_boxplot(width = 0.6) +
    ggplot2::coord_cartesian(ylim = c(axis.scale[3],
                              axis.scale[4])) +
    ggplot2::geom_hline(yintercept = 0,
               linetype = 'solid',
               size = 0.5,
               alpha = 0.5,
               color = 'firebrick') +
    ggplot2::theme_light() +
    ggplot2::theme(panel.grid.minor = ggplot2::element_blank(),
          panel.grid.major.x = ggplot2::element_blank(),
          axis.title.y = ggplot2::element_blank(),
          axis.ticks.y = ggplot2::element_blank(),
          axis.text.y = ggplot2::element_blank(),
          axis.title.x = ggplot2::element_text(color = NA,
                                      size = lab_size),
          axis.text.x = ggplot2::element_text(color = NA),
          axis.ticks.x = ggplot2::element_line(color = NA))

  if (grid_dense) {
    dis.boxplot <- dis.boxplot + ggplot2::scale_y_continuous(breaks =
                                   round(seq(axis.scale[3],
                                             axis.scale[4],
                                             by = 0.2), 1))
  }

  # Boxplot on the bottom.
  pub.boxplot <- ggplot2::ggplot(graph.data,
                                 ggplot2::aes(factor(1), x)) +
    ggplot2::geom_boxplot(width = 0.6) +
    ggplot2::coord_flip(ylim = c(axis.scale[1],
                        axis.scale[2])) +
    ggplot2::geom_hline(yintercept = 0,
               linetype = 'solid',
               size = 0.5,
               alpha = 0.5,
               color = 'firebrick') +
    ggplot2::theme_light() +
    ggplot2::theme(panel.grid.minor = ggplot2::element_blank(),
          panel.grid.major.y = ggplot2::element_blank(),
          axis.title.x = ggplot2::element_blank(),
          axis.ticks.x = ggplot2::element_blank(),
          axis.text.x = ggplot2::element_blank(),
          axis.title.y = ggplot2::element_text(color = NA,
                                      size = lab_size),
          axis.text.y = ggplot2::element_text(color = NA),
          axis.ticks.y = ggplot2::element_line(color = NA))

  if (grid_dense) {
    pub.boxplot <- pub.boxplot + ggplot2::scale_y_continuous(breaks =
                                   round(seq(axis.scale[1],
                                             axis.scale[2],
                                             by = 0.2), 1))
  }

  # Append annotated values to the graphs.
  if (annotate) {
    xy.correlation <- round(stats::cor(x, y), 2)
    x.mean <- round(mean(x), 2)
    y.mean <- round(mean(y), 2)
    ann.xy.corr <- paste('r =', xy.correlation, ' ')
    ann.x.mean <- paste('x M =', x.mean, ' ')
    ann.y.mean <- paste('y M =', y.mean, ' ')
    print('annotation x axis scale')
    print(axis.scale[2])

    main.plot <- main.plot +
      ggplot2::annotate('text',
                        x = rep(axis.scale[2] / 1.2, 3),
                        y = c(axis.scale[4] / 1.1,
                              axis.scale[4] / 1.2,
                              axis.scale[4] / 1.3),
                        label = c(ann.xy.corr,
                                  ann.x.mean,
                                  ann.y.mean),
                        size = (lab_size / 3),
                        hjust = 0)
  }

  # Recreating plots to fit into grid layout.
  main.plot <- ggplot2::ggplot_gtable(
    ggplot2::ggplot_build(main.plot))
  pub.boxplot <- ggplot2::ggplot_gtable(
    ggplot2::ggplot_build(pub.boxplot))
  dis.boxplot <- ggplot2::ggplot_gtable(
    ggplot2::ggplot_build(dis.boxplot))

  # Aligning main plot and the one on the bottom.
  max.width <- grid::unit.pmax(main.plot$widths[2:3],
                         pub.boxplot$widths[2:3])
  main.plot$widths[2:3] <- max.width
  pub.boxplot$widths[2:3] <- max.width

  # Aligning main plot and the one on the left.
  max.height <- grid::unit.pmax(main.plot$heights[2:3],
                          dis.boxplot$heights[2:3])
  main.plot$heights[2:3] <- max.height
  dis.boxplot$heights[2:3] <- max.height

  #  Viewport and grob creation for the main title of the plot.
  vpMainTitle <- grid::viewport(layout.pos.row = 1)
  main.title <- grid::textGrob(main_lab, vp = vpMainTitle,
                               gp = grid::gpar(fontsize = lab_size,
                                               cex = 1.2))

  if (bxplts) {
    # This part is the default behavior of the script.
    # Arranges layout of grobs from grid package.
    plot.layout.matrix <- rbind(c(1, 1),
                                c(2, 3),
                                c(4, 5))
    # Put all plotting regions together.
    gridExtra::grid.arrange(grobs = list(main.title, dis.boxplot,
                                         main.plot, blank.plot,
                                         pub.boxplot),
                            layout_matrix = plot.layout.matrix,
                            ncol = 2, nrow = 3,
                            widths = grid::unit(c(1, 8),
                                                c('null', 'null')),
                            heights = grid::unit(c(3, 8, 1),
                                                 c('lines', 'null',
                                                   'null')))
  } else {
    # When boxplots are suppressed, this part of the script runs.
    # Arranges layout of grobs from grid package.
    # A layout of two rows and one column.
    plot.layout.matrix <- rbind(c(1),
                                c(2))
    # Put all plotting regions together.
    gridExtra::grid.arrange(grobs = list(main.title,
                              main.plot),
                            layout_matrix = plot.layout.matrix,
                            ncol = 1, nrow = 2,
                            heights = grid::unit(c(3, 1),
                                                 c('lines', 'null')))
  }

  # Turning off graphing device (i.e., tiff())
  # grDevices::graphics.off()
}
