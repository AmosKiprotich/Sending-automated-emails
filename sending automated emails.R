library(dplyr)
library(blastula)
# this function adds current date and time
date_time<-add_readable_time()
#helps formulate the email, the body contains main content of the email,
#footer include foot notes
email <-
  
  compose_email(
    
    body = md(glue::glue(
      "Hello,

Kindly find **attached memo** take care

")),
    
    footer = md(glue::glue("Email sent on {date_time} \n\n Amos is fantastic"))
  )
  
#use to insert password of the email
create_smtp_creds_file( file = "gmail_creds",
                        user = "your@gmail.com",
                        provider = "gmail",
                        use_ssl = TRUE  )
#sending the email
email %>%
  smtp_send(
    to = "send@gmail.com",
    from = "your@gmail.com",
    subject = "Automate sending `Emails`",
    credentials = creds_file("gmail_creds")
  )
