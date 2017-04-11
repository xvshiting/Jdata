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
#查看同一User-Id 和 Sku_id 的action
action_user_skuid<-function(user,sku)
  {
  dd<-JData_Action[which(JData_Action$user_id==user&JData_Action$sku_id==sku&JData_Action$type==4),3]
  JData_Action[which(JData_Action$user_id==user&JData_Action$sku_id==sku&JData_Action$time<=dd),]
}
#查看同一User-Id 和 Cate 的action  
#action_user_skuid(JData_Action.buy$user_id[1000],JData_Action.buy$sku_id[1000])
#
action_user_cateid<-function(user,cate)
{
  JData_Action[which(JData_Action$user_id==user&JData_Action$cate==cate),]
}
#查看同一User 和 Brand 的 action
#process time (convert to numeric)
#extra 提取发生过购买行为的用户行为
JData_User_buy<-unique(JData_Action[JData_Action$type==4,1])
#发生过购买行为的用户信息
JData_User_buy.info<-JData_User[!is.na(match(JData_User$user_id,JData_User_buy)),]
#发生过购买行为的用户 所有行为
JData_Action.User_Buy<-JData_Action[which(!is.na(match(JData_Action$user_id,JData_User_buy))),]
#所有购买行为
JData_Action.buy<-JData_Action[JData_Action$type==4,1]














