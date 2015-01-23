
# Load model and test data (model and testdata)
load("rfmodel.RData", verbose=TRUE)
load("testdata.RData", verbose=TRUE)

# Function to write predictions to separate files
pml_write_files = function(x){
        n = length(x)
        for(i in 1:n){
                filename = paste0("probid",i,".txt")
                write.table(x[i],file=filename,quote=FALSE,row.names=FALSE,col.names=FALSE)
        }
}

# Prediction
library(randomForest)
library(caret)
answers <- predict(model, testdata)

# write answers to files
pml_write_files(answers)