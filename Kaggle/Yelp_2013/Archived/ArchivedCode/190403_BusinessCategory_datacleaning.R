
library(jsonlite)
business <- stream_in(file("C:/Users/user/Desktop/yelp/business.json"))
business_attributes <- business$attributes
#??Y??Y-i¢D??business????attributesAa|iAu??}¡LO??Yao??E??l
#¡Pi¡±U-I-n??F¡MN-t¡LCA\AU¡LaGoodForKids¡ÂS??xRE  ??@¢DOAA£gM
#3o¡¦N??O¡±U-Iao-nao??E??l
View(head(business_attributes))
class(business_attributes)


#|paG1ijsonAE¢DI¢X£g??¢X??o??E??lAU??O¡LS¡PPA¡Ó,¢DH??U¡±U¡ÓNattributes????aoNA¡ME|¡L'unknown'
#£gM??a¡±abusiness_attributes3o-OdataframeAa|¡LjsonAE??e¢DX
#¢Di¢DH¡±a¢D|¢Da??ivscode¡MIA[??a¡¦N|3¡P¡±cA??F
business_attributes[is.na(business_attributes)] <- "unknown"
head(business_attributes)
business_attributes_json_newversion <- toJSON(business_attributes,pretty=TRUE, flatten=TRUE, auto_unbox=TRUE)
write(business_attributes_json_newversion, "C:/Users/user/Desktop/yelp/business_attributes_json_newversion.json")


######################################################
## ¢DO??D: ¡ÓNbusiness????aoA\A¢DcategorycO¢DX??O¢Ds¡ÂS??xAt¡±O ##
##       |A¢DH¡ÂS??xAt¡±Oao¡L????¡Ñ,2I-p-t¡LCA\AU2A|X??Y¡ÂS??x  ##
###################################################### 
######################################################
# -o¢Dy¡±U-I-n¡±a¡LC??@-O¡ÂS??xAa|¡L json ao??E??l 
library(jsonlite)
business <- stream_in(file("C:/Users/user/Desktop/yelp/business.json"))
#¡ÓNcatgory3a??W¡±i¢DX
cat <- business$categories
View(head(cat))
class(cat)  #character

#3z1LView(head(cat))A[1i¡LC-O cat ????¡LO|p "Golf,active life"
#3¢G??O¢DI,??A3I  co??O¡±U-I¡±a¢D|ci??}AU|¡L??@-O??jlist
cattemp <-strsplit(cat ,",")
View(head(cattemp)) 
class(head(cattemp)) #list
cattemp[[1]][1] #'Golf'
cattemp[[1]] # 'Golf' 'active life'

#-nAU|¡Ljsonao??E??l
#ex "Golf":"TRUE"
#3o¡MI??O¢DI¢Xj¢Xe3B2z
# \ ??O¡Mo2a|r??¡M
for(i in 1:length(cattemp)){
  cattemp[[i]] <- paste("\"" , cattemp[[i]], "\":\"TRUE\"")
}
cattemp[[1]][1] # "\" Golf \":\"TRUE\""


#¢DO??D -nAU|¡L3o??E
#{"Golf":"TRUE", "Active life":"TRUE"},
#{"XXXX":"TRUE","XXXX":"TRUE",........},
#{....},....
#¢Dy¡Ps??W??@-Oc(),¡±acO|3{....}¢Dt3!cn??i¢Dh,¢DH??K3I??aAU|¡LjasonArray
catcolNew <- c()
for(i in 1:length(cattemp)){
  temp3 <- paste("{" , paste(cattemp[[i]], collapse =","), "}")
  catcolNew <- c(catcolNew, temp3)
}
catcolNew

#¢DO??DAU|¡L
#[
# {"Golf":"TRUE", "Active life":"TRUE"},
# {"XXXX":"TRUE","XXXX":"TRUE",........},
# {....},....
#             ]
# 3I??a 3IAY3I¡±A¢D[??W[] AU|¡L??@-O??W??jaojsonArray
cat_jsonArray <- paste("[", paste(catcolNew, collapse = ","), "]")

#fromJason¡Âa¢DOjasonArrayAU|¡Ldataframe
cat_dataframe <- fromJSON(cat_jsonArray)

#3I??a|]??¢XAa|i|WoU??e??a|3aARa,¡±U-I¡±a¢DL¡±i¢DX¡LOtrim¡Ó??|Acn|^¢Dh
allcolnames <- names(cat_dataframe)
names(cat_dataframe) <- trimws(allcolnames,"both")
names(cat_dataframe)

#|¡L??~
View(head(cat_dataframe))


