# r

raw <- dir("../app/assets/images/csf_raw")

raw2 <- substring(raw, 1, 9)

length(raw2)
length(unique(raw2))

grep(raw, "_L")

dat <- read.delim("csf.txt", as.is=TRUE, header=FALSE)

store <- data.frame()

for (i in 1:dim(dat[1])) {
  
  store <- rbind(store, data.frame(id=i, location=dat[i,1], exposure=dat[i,2],))
  
  
}

dat2 <- cbind(seq(1:dim(dat)[1]), dat[,1], dat[,2], dat[,4], rep("", dim(dat)[1]), dat[,3], dat[,5], rep("", dim(dat)[1]), rep("", dim(dat)[1]), rep("", dim(dat)[1]))
# dat2[dat2==""] = NA
write.csv(dat2, "corals.csv", quote=TRUE, na="", row.names=FALSE)

# create_table "corals", force: true do |t|
#   t.string   "location"
#   t.string   "exposure"
#   t.integer  "image_id"
#   t.string   "species"
#   t.string   "growth_form"
#   t.decimal  "distance"
#   t.text     "notes"
#   t.datetime "created_at"
#   t.datetime "updated_at"
# end
