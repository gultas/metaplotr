crosshairs(FergusonBrannick2012$pub_z, FergusonBrannick2012$dis_z,
           FergusonBrannick2012$pub_z_se, FergusonBrannick2012$dis_z_se,
           mdrtr = FergusonBrannick2012$mod, annotate = TRUE,
           main_lab = 'Moderator Legend and Annotation')

crosshairs(FergusonBrannick2012$pub_z, FergusonBrannick2012$dis_z,
FergusonBrannick2012$pub_z_se, FergusonBrannick2012$dis_z_se,
mdrtr = FergusonBrannick2012$mod, pnt_size = 6,
main_lab = 'Bigger Dots')

# confint option can control whiskers length.
crosshairs(FergusonBrannick2012$pub_z, FergusonBrannick2012$dis_z,
FergusonBrannick2012$pub_z_se, FergusonBrannick2012$dis_z_se, confint = .95)
crosshairs(FergusonBrannick2012$pub_z, FergusonBrannick2012$dis_z,
FergusonBrannick2012$pub_z_se, FergusonBrannick2012$dis_z_se, confint = .7)
crosshairs(FergusonBrannick2012$pub_z, FergusonBrannick2012$dis_z,
FergusonBrannick2012$pub_z_se, FergusonBrannick2012$dis_z_se, confint = .2)

# Main and axes labels can be changed.
crosshairs(FergusonBrannick2012$pub_z, FergusonBrannick2012$dis_z,
FergusonBrannick2012$pub_z_se, FergusonBrannick2012$dis_z_se,
main_lab = 'Different Main Label', x_lab = 'Different X Label',
y_lab = 'Different Y Label')

# Annotated correlation and meand values can be added to the graph.
crosshairs(FergusonBrannick2012$pub_z, FergusonBrannick2012$dis_z,
FergusonBrannick2012$pub_z_se, FergusonBrannick2012$dis_z_se, annotate = TRUE,
main_lab = 'Annotated Graph')

# Boxplots can be hidden.
crosshairs(FergusonBrannick2012$pub_z, FergusonBrannick2012$dis_z,
FergusonBrannick2012$pub_z_se, FergusonBrannick2012$dis_z_se,
main_lab = 'No Boxplots', bxplts = FALSE)

# Moderator legend and annotations can be used simulaneously.
crosshairs(FergusonBrannick2012$pub_z, FergusonBrannick2012$dis_z,
FergusonBrannick2012$pub_z_se, FergusonBrannick2012$dis_z_se,
mdrtr = FergusonBrannick2012$mod, annotate = TRUE,
main_lab = 'Moderator Legend and Annotation')

# Dot size can be changed.
crosshairs(FergusonBrannick2012$pub_z, FergusonBrannick2012$dis_z,
FergusonBrannick2012$pub_z_se, FergusonBrannick2012$dis_z_se,
mdrtr = FergusonBrannick2012$mod, pnt_size = 6,
main_lab = 'Bigger Dots')

# Size of labels can be changed.
crosshairs(FergusonBrannick2012$pub_z, FergusonBrannick2012$dis_z,
FergusonBrannick2012$pub_z_se, FergusonBrannick2012$dis_z_se,
mdrtr = FergusonBrannick2012$mod, lab_size = 20,
main_lab = 'Label Size Change')
