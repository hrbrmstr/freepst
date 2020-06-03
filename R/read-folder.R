#' Get all messages in an OST/PST with nested folder metadata
#'
#' @param path path to OST/PST
#' @return data frame
#' @author Torben Tvedebrink
#' @export
#' @examples
#' read_folder(system.file("extdata/example-2013.ost", package="freepst"))
#' read_folder(system.file("extdata/dist-list.pst", package="freepst"))
read_folder <- function (path) {
  path <- path.expand(path)
  if (!file.exists(path))
    stop(sprintf("'%s' not found.", path), call. = FALSE)
  f <- new(J("com.pff.PSTFile"), path)
  rf <- f$getRootFolder()
  depth <- -1
  msgs <- list()
  process_folder <- function(folder, par_folder = "") {
    if (folder$hasSubfolders()) {
      child_folders <- as.list(folder$getSubFolders())
      folder_name <- folder$getDisplayName()
      par_folder <- paste0(par_folder, "/", folder_name)
      lapply(child_folders, process_folder, par_folder = par_folder)
    }
    if (folder$getContentCount() > 0) {
      repeat {
        email <- folder$getNextChild()
        if (is.jnull(email))
          break
        if (email$getMessageClass() == "IPM.Microsoft.ScheduleData.FreeBusy"){
          next
        }
        ## browser()
        tmp <- list(
          parent_folder = par_folder %l0% "",
          folder = folder$getDisplayName() %l0% "",
          sent_by = email$getSenderName()  %l0% "",
          sent_by_addr = email$getSenderEmailAddress() %l0% "",
          received_by = email$getReceivedByName() %l0% "",
          received_by_addr = email$getReceivedByAddress() %l0% "",
          recipients = email$getRecipientsString() %l0% "",
          sent_time = email$getClientSubmitTime()$toString() %l0% "",
          delivery_time = email$getMessageDeliveryTime()$toString() %l0% "",
          importance = email$getImportance() %l0% "",
          priority = email$getPriority() %l0% "",
          attachment_count = email$getNumberOfAttachments() %l0% "",
          subject = email$getSubject() %l0% "",
          body = email$getBody() %l0% "",
          headers = email$getTransportMessageHeaders() %l0% "",
          tostr = email$toString() %l0% ""
        )
        msgs <<- c(msgs, list(tmp))
      }
    }
  }

  process_folder(rf)

  msgs <- do.call(rbind.data.frame, msgs)

  class(msgs) <- c("tbl_df", "tbl", "data.frame")

  msgs[["folder"]] <- paste(msgs[["parent_folder"]], msgs[["folder"]], sep = "/")
  msgs[["parent_folder"]] <- NULL

  ## The top level echos "Top of Outlook data file" hence, this and leading slashes are removed before return.
  msgs[["folder"]] <- sub("^.*Top of .*\\/", "", msgs[["folder"]])
  msgs[["folder"]] <- sub("^//", "/", msgs[["folder"]])

  msgs

}
