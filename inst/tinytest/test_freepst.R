library(freepst)

x <- read_pst(system.file("extdata/example-2013.ost", package="freepst"))

expect_true(inherits(x, "data.frame"))
expect_true(x$folder[[1]] == "Inbox")
expect_true(x$sent_by[[3]] == "Bernard Chung")

x <- read_pst(system.file("extdata/dist-list.pst", package="freepst"))

expect_true(inherits(x, "data.frame"))
expect_true(x$folder[[1]] == "Calendar")
expect_true(x$subject[[3]] == "test dist list")

