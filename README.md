
![](imgs/free.jpg)

Get out of PST Jail Free!

`freepst` : Read OST/PST Files

An 'rJava' wrapper around 'java-libpst' <https://github.com/rjohnsondev/java-libpst>.

The following functions are implemented:

-   `read_pst`: Get all messages in an OST/PST

### Installation

``` r
devtools::install_github("hrbrmstr/freepst")
```

### Usage

``` r
library(freepst)

# current verison
packageVersion("freepst")
```

    ## [1] '0.1.0'

``` r
dplyr::glimpse(read_pst(system.file("extdata/example-2013.ost", package="freepst")))
```

    ## Observations: 3
    ## Variables: 14
    ## $ sent_by          <chr> "Microsoft Outlook", "Microsoft Outlook", "Bernard Chung"
    ## $ sent_by_addr     <chr> "arc.test1@apogeephysicians.com", "arc.test1@apogeephysicians.com", "bernard.chung@apogeep...
    ## $ received_by      <chr> "Arc Test", "Arc Test", "Arc Test"
    ## $ received_by_addr <chr> "arc.test1@apogeephysicians.com", "arc.test1@apogeephysicians.com", "arc.test1@apogeephysi...
    ## $ recipients       <chr> "No recipients table!", "No recipients table!", "No recipients table!"
    ## $ sent_time        <chr> "Thu Jun 05 12:22:32 EDT 2014", "Wed Apr 09 15:54:39 EDT 2014", "Wed Apr 09 12:38:31 EDT 2...
    ## $ delivery_time    <chr> "Thu Jun 05 12:22:32 EDT 2014", "Wed Apr 09 15:54:39 EDT 2014", "Wed Apr 09 12:38:32 EDT 2...
    ## $ importance       <int> 1, 1, 1
    ## $ priority         <int> 0, 0, 0
    ## $ attachment_count <int> 0, 0, 0
    ## $ subject          <chr> "Microsoft Outlook Test Message", "Microsoft Outlook Test Message", "Test 2"
    ## $ body             <chr> "", "", ""
    ## $ headers          <chr> "Return-Path: <arc.test1@apogeephysicians.com>\r\nDelivered-To: arc.test1@apogeephysicians...
    ## $ tostr            <chr> "PSTEmail: Microsoft Outlook Test Message\nImportance: 1\nMessage Class: IPM.Note\n\nRetur...

``` r
dplyr::glimpse(read_pst(system.file("extdata/dist-list.pst", package="freepst")))
```

    ## Observations: 3
    ## Variables: 14
    ## $ sent_by          <chr> "Unknown", "Unknown", "Unknown"
    ## $ sent_by_addr     <chr> "Unknown", "Unknown", "Unknown"
    ## $ received_by      <chr> "", "", ""
    ## $ received_by_addr <chr> "", "", ""
    ## $ recipients       <chr> "No recipients table!", "No recipients table!", "No recipients table!"
    ## $ sent_time        <chr> "Mon Aug 01 20:27:12 EDT 2016", "Sun May 25 09:58:28 EDT 2014", "Sun May 25 09:58:59 EDT 2...
    ## $ delivery_time    <chr> "Mon Aug 01 20:27:12 EDT 2016", "Sun May 25 09:58:28 EDT 2014", "Sun May 25 09:58:59 EDT 2...
    ## $ importance       <int> 1, 1, 1
    ## $ priority         <int> 0, 0, 0
    ## $ attachment_count <int> 2, 0, 0
    ## $ subject          <chr> "Test appointment", "contact name 1", "test dist list"
    ## $ body             <chr> "This is a complete test\r\n", "", ""
    ## $ headers          <chr> "", "", ""
    ## $ tostr            <chr> "PSTEmail: Test appointment\nImportance: 1\nMessage Class: IPM.Appointment\n\n\n\n\n{4096=...

### Test Results

``` r
library(freepst)
library(testthat)

date()
```

    ## [1] "Thu Aug 24 09:02:17 2017"

``` r
test_dir("tests/")
```

    ## testthat results ========================================================================================================
    ## OK: 0 SKIPPED: 0 FAILED: 0
    ## 
    ## DONE ===================================================================================================================
