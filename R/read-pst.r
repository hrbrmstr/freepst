#' Get all messages in an OST/PST
#'
#' @param path path to OST/PST
#' @return data frame
#' @export
#' @examples
#' read_pst(system.file("extdata/example-2013.ost", package="freepst"))
#' read_pst(system.file("extdata/dist-list.pst", package="freepst"))
read_pst <- function(path) {

  path <- path.expand(path)
  if (!file.exists(path)) stop(sprintf("'%s' not found.", path), call.=FALSE)
  f <- new(J("com.pff.PSTFile"), path)

  rf <- f$getRootFolder()

  depth <- -1

  msgs <- list()

  process_folder <- function(folder) {

    if (folder$hasSubfolders()) {
      child_folders <- folder$getSubFolders()
      lapply(as.list(child_folders), process_folder)
    }

    if (folder$getContentCount() > 0) {

      repeat {
        email <- folder$getNextChild()
        if (is.jnull(email)) break
        if (email$getMessageClass() == "IPM.Microsoft.ScheduleData.FreeBusy") next
        tmp <- list(
          folder = folder$getDisplayName(),
          sent_by = email$getSenderName(),
          sent_by_addr = email$getSenderEmailAddress(),
          received_by = email$getReceivedByName(),
          received_by_addr = email$getReceivedByAddress(),
          recipients = email$getRecipientsString(),
          sent_time = email$getClientSubmitTime()$toString(),
          delivery_time = email$getMessageDeliveryTime()$toString(),
          importance = email$getImportance(),
          priority = email$getPriority(),
          attachment_count = email$getNumberOfAttachments(),
          subject = email$getSubject(),
          body = email$getBody(),
          headers = email$getTransportMessageHeaders(),
          tostr = email$toString()
        )
        msgs <<- c(msgs, list(tmp))
      }

    }

  }

  process_folder(rf)

  return(dplyr::bind_rows(msgs))

}
