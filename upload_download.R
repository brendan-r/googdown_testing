# A function to generate tokens (not *yet* using a custom environment)
gdoc_token <- function() {
  myapp <- httr::oauth_app(
    "google",
    key = Sys.getenv("GOOGLE_CLIENT_ID"),
    secret    = Sys.getenv("GOOGLE_CLIENT_SECRET")
  )
  
  # 3. Get OAuth credentials
  httr::oauth2.0_token(
    httr::oauth_endpoints("google"), myapp,
    scope = "https://www.googleapis.com/auth/drive.file"
  )
}

# Upload an md / Rmd file
gdoc_upload <- function(
  file_name, token,
  format = c("html_document", "html_document_base", "word_document", 
             "rtf_document", "odt_document")
) {

  library(rmarkdown)
  
  local_file  <- rmarkdown::render(file_name, get(format)())
  
  req <- httr::POST(
    "https://www.googleapis.com/upload/drive/v2/files?convert=true",
    httr::config(token = token),
    body = httr::upload_file(local_file)
  )
  
  httr::content(req)
}

# Download an Rmd / md file
gdoc_download <- function(
  file_id, file_name = "./file.md", token,
  format = reader_list()
) {
  
  temp_file <- tempfile(fileext = ".md")
  
  req <- httr::GET(
    paste0(
      "https://www.googleapis.com/drive/v2/files/",
      file_id,
      "/export?mimeType=", file_types()[[format]]$mime_type
    ),
    httr::config(token = token),
    httr::write_disk(temp_file, TRUE)
  )
  
  system(
    paste0("pandoc ", temp_file, " -f ", file_types()[[format]]$pandoc_type,
           " -t markdown"), 
    intern = TRUE
  ) %>% writeLines(file_name)
}


file_types <- function() {
  list(
    html            = list(
      file_ext = ".html", pandoc_type = "html", mime_type = "text/html"
    ),
    plain_text      =	list(
      file_ext = ".txt", pandoc_type = "text", mime_type = "text/plain"
    ),
    rich_text       =	list(
      file_ext = ".rtf", pandoc_type = "rtf", mime_type = "application/rtf"
    ),
    open_office_doc =	list(
      file_ext = ".odt", pandoc_type = "odt", 
      mime_type = "application/vnd.oasis.opendocument.text"
    ),
    ms_word_doc     =	list(
      file_ext = ".docx", pandoc_type = "docx",
      mime_type = "application/vnd.openxmlformats-officedocument.wordprocessingml.document"
    )
  )
}

reader_list <- function() {
  c("html", "plain_text", "rich_text", "open_office_doc", "ms_word_doc")
}
