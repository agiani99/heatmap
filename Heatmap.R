### HEATMAP #####
library(pheatmap)
mydata <- read.csv2("Y:/R/mydata.csv", row.names = 1)
df.coldata <-read.csv2("Y:/R/coldata.csv", row.names = 1)

# Specify colors
Tanks <- levels(df.coldata$Tank)
Conditions <- levels(df.coldata$Condition)

ann_colors = list(
  Condition = c(Control="lightskyblue",
                LowExposure="royalblue1",
                HighExposure="navyblue"),
  ## This doenst work ... BUGS here:
  Tank = c(Tanks[1]="gray90",
           Tanks[2]="gray65",
           Tanks[3]="gray40")
)

# Hence need to manually specify the factors for the colors. Tidious especially 
# as the tank number changes with the different experiments.
ann_colors = list(
  Condition = c(Control="lightskyblue",
                LowExposure="royalblue1",
                HighExposure="navyblue"),
  Tank = c(T14_3="gray90",
           T6="gray65",
           T8="gray40")
)

# Zscore normalized rows
pheatmap(mydata,
         angle_col = "0",
         border_color = NA, # "grey60" as default
         cluster_rows=TRUE,
         cluster_cols=TRUE,
         clustering_distance_rows = "maximum", # 'correlation', 'euclidean', 'maximum', 'manhattan', 'canberra', 'binary', 'minkowski'
         clustering_distance_cols = "maximum", # 'correlation', 'euclidean', 'maximum', 'manhattan', 'canberra', 'binary', 'minkowski'
         clustering_method = "average", # complete single average 
         scale = "row", #normalization of values row or col wise
         main = "z-score norm. rows",
         show_rownames=TRUE, 
         show_colnames = TRUE,
         color = gplots::greenred(75),
         annotation_col = df.coldata,
         annotation_colors = ann_colors)

# Mean rlog transformed counts
pheatmap(mydata,
         angle_col = "0",
         border_color = NA, # "grey60" as default
         cluster_rows=TRUE,
         cluster_cols=TRUE,
         clustering_distance_rows = "maximum", # 'correlation', 'euclidean', 'maximum', 'manhattan', 'canberra', 'binary', 'minkowski'
         clustering_distance_cols = "maximum", # 'correlation', 'euclidean', 'maximum', 'manhattan', 'canberra', 'binary', 'minkowski'
         clustering_method = "average", # complete single average 
         main = "rlog(mean counts)",
         show_rownames=TRUE, 
         show_colnames = TRUE,
         color = gplots::greenred(75),
         annotation_col = df.coldata,
         annotation_colors = ann_colors)
