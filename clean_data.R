#Load_data
  JData_Action_02<-read.csv2("DATA/JData_Action_201602.csv",header = T,sep=c(",","."))
  JData_Action_03<-read.csv2("DATA/JData_Action_201603.csv",header = T,sep=c(",","."))
  JData_Action_04<-read.csv2("DATA/JData_Action_201604.csv",header = T,sep=c(",","."))
  JData_Comment<-read.csv2("DATA/JData_Comment.csv",header = T,sep=c(",","."))
  JData_Product<-read.csv2("DATA/JData_Product.csv",header = T,sep=c(",","."))
  JData_User<-read.csv2("DATA/JData_User.csv",header = T,sep=c(",","."))
#clean_data
#UserID to Interger
JData_Action_02$user_id<-as.factor(as.numeric(as.character(JData_Action_02$user_id)))
JData_Action_03$user_id<-as.factor(as.numeric(as.character(JData_Action_03$user_id)))
JData_Action_04$user_id<-as.factor(as.numeric(as.character(JData_Action_04$user_id)))
#time to Date
JData_Action_02$time<-as.Date(JData_Action_02$time)
JData_Action_03$time<-as.Date(JData_Action_03$time)
JData_Action_04$time<-as.Date(JData_Action_04$time)
JData_Action<-rbind(JData_Action_02,JData_Action_03,JData_Action_04)


#factor to numeric
factor_t_numeric<-function(x){
  as.numeric(as.character(x))
}
#process time (convert to numeric)

