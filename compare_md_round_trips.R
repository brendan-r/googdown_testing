# Some code to try out a few different features with different combinations of
# readers and writers

# You will have a directory of test files, for each file, run through each reader and writer

# Note: You should probably
#  - Make this use your other account
#  - Make this use the hashes of the pandoc ASTs -- not the files themselves 
#      (trailing whitespace, etc. etc.)

# Init the results df
results <- data.frame(test = NA, upload_format = NA, download_format = NA, 
                      match = NA)

for (u in upload_formats) {
  for (d in download_formats) {
    # Create a dir to store the results in
    result_dir <- dir.create(paste0(u, "-", d))
    setwd(normalizePath(result_dir))
    
    for (t in test_files) {
      # Upload the test file to google docs
      upload <- gdoc_upload(token = token, file_name = t, format = u)
      
      # Download the test file
      returned_file_name <- paste0("returned-", t)
      download <- gdoc_download(file_id = upload$Id, token = token, 
                                file_name = returned_file_name)
      
      # See if it came out the same, put the results in the output data.frame
      same <- bind_rows(
        same, 
        data.frame(test = t, upload_format = u, download_format = d, 
                   same = openssl::md5(t) == openssl::md5(returned_file_name))
      )
    }
    # Pop a level up the dir structure
    setwd("..")
  }
}

