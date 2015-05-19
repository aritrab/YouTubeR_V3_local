allvideoviz<-function(dataset){
  
  library(dplyr)
  library(tidyr)
  library(ggplot2)
  
  ggplot2::theme_set(theme_light())
  
  p1<-ggpairs(dataset[, 9:17],upper = list(params = c(corSize=6,alpha = 0.9)), lower=list(continuous="smooth",params=c(colour="#DD8888",alpha = 0.6)))
    
  cbbPalette <- c("#FBB4AE" ,"#B3CDE3", "#CCEBC5", "#DECBE4", "#FED9A6", "#FFFFCC", "#E5D8BD", "#FDDAEC","#F2F2F2")
  
  dataset_1<-cbind(dataset[,1],dataset[,9:17])
  
  dataset_1<-gather(dataset_1,variable,key,-id)
  
  dataset_1<-group_by(dataset_1,id)
  
  dataset_1<-mutate(dataset_1,par=key/sum(key)*100)
  
  dataset_1<-select(dataset_1,-key)
    
  
  p2<-ggplot(data=dataset_1, aes(x=factor(id),y=par,fill=variable)) +
    geom_bar(stat="identity",position=position_stack())
  
  dataset_2<-cbind(dataset[,1],dataset[,9:17])
  
  dataset_2<-gather(dataset_2,variable,key,-id)
  
  dataset_2<-group_by(dataset_2,id)
  

  p3<-ggplot(data=dataset_2, aes(x=factor(id),y=key,fill=variable)) +
    geom_bar(stat="identity",position=position_dodge())
  
  allvideoviz<-list(p1,p2,p3)
  
  return(allvideoviz)}