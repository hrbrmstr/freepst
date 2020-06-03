
[![Project Status: Active – The project has reached a stable, usable
state and is being actively
developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)
[![Signed
by](https://img.shields.io/badge/Keybase-Verified-brightgreen.svg)](https://keybase.io/hrbrmstr)
![Signed commit
%](https://img.shields.io/badge/Signed_Commits-100%25-lightgrey.svg)
[![Linux build
Status](https://travis-ci.org/hrbrmstr/freepst.svg?branch=master)](https://travis-ci.org/hrbrmstr/freepst)
[![Coverage
Status](https://codecov.io/gh/hrbrmstr/freepst/branch/master/graph/badge.svg)](https://codecov.io/gh/hrbrmstr/freepst)
![Minimal R
Version](https://img.shields.io/badge/R%3E%3D-3.2.0-blue.svg)
![License](https://img.shields.io/badge/License-Apache-blue.svg)

![](imgs/free.jpg)

# freepst

Read OST/PST Files

## Description

An ‘rJava’ wrapper around ‘java-libpst’
<https://github.com/rjohnsondev/java-libpst>. The PST File format is
used by Outlook for the storage of emails. Over the years many people
have accumulated a large amount of important email and other information
into these files. Tools are provided to enable folks to access and
extract this information for archival or analysis.

Get out of PST Jail Free\!

## What’s Inside The Tin

The following functions are implemented:

  - `read_folder`: Get all messages in an OST/PST with nested folder
    metadata
  - `read_pst`: Get all messages in an OST/PST

## Installation

``` r
remotes::install_gitlab("hrbrmstr/freepst")
# or
remotes::install_github("hrbrmstr/freepst")
```

NOTE: To use the ‘remotes’ install options you will need to have the
[{remotes} package](https://github.com/r-lib/remotes) installed.

## Usage

``` r
library(freepst)

# current version
packageVersion("freepst")
## [1] '0.2.0'
```

``` r
dplyr::glimpse(read_pst(system.file("extdata/example-2013.ost", package="freepst")))
## Rows: 3
## Columns: 15
## $ folder           <chr> "Inbox", "Inbox", "Sent Items"
## $ sent_by          <chr> "Microsoft Outlook", "Microsoft Outlook", "Bernard Chung"
## $ sent_by_addr     <chr> "arc.test1@apogeephysicians.com", "arc.test1@apogeephysicians.com", "bernard.chung@apogeephy…
## $ received_by      <chr> "Arc Test", "Arc Test", "Arc Test"
## $ received_by_addr <chr> "arc.test1@apogeephysicians.com", "arc.test1@apogeephysicians.com", "arc.test1@apogeephysici…
## $ recipients       <chr> "No recipients table!", "No recipients table!", "No recipients table!"
## $ sent_time        <chr> "Thu Jun 05 12:22:32 EDT 2014", "Wed Apr 09 15:54:39 EDT 2014", "Wed Apr 09 12:38:31 EDT 201…
## $ delivery_time    <chr> "Thu Jun 05 12:22:32 EDT 2014", "Wed Apr 09 15:54:39 EDT 2014", "Wed Apr 09 12:38:32 EDT 201…
## $ importance       <int> 1, 1, 1
## $ priority         <int> 0, 0, 0
## $ attachment_count <int> 0, 0, 0
## $ subject          <chr> "Microsoft Outlook Test Message", "Microsoft Outlook Test Message", "Test 2"
## $ body             <chr> "", "", ""
## $ headers          <chr> "Return-Path: <arc.test1@apogeephysicians.com>\r\nDelivered-To: arc.test1@apogeephysicians.c…
## $ tostr            <chr> "PSTEmail: Microsoft Outlook Test Message\nImportance: 1\nMessage Class: IPM.Note\n\nReturn-…

dplyr::glimpse(read_pst(system.file("extdata/dist-list.pst", package="freepst")))
## Rows: 3
## Columns: 15
## $ folder           <chr> "Calendar", "Contacts", "Contacts"
## $ sent_by          <chr> "Unknown", "Unknown", "Unknown"
## $ sent_by_addr     <chr> "Unknown", "Unknown", "Unknown"
## $ received_by      <chr> "", "", ""
## $ received_by_addr <chr> "", "", ""
## $ recipients       <chr> "No recipients table!", "No recipients table!", "No recipients table!"
## $ sent_time        <chr> "Mon Aug 01 20:27:12 EDT 2016", "Sun May 25 09:58:28 EDT 2014", "Sun May 25 09:58:59 EDT 201…
## $ delivery_time    <chr> "Mon Aug 01 20:27:12 EDT 2016", "Sun May 25 09:58:28 EDT 2014", "Sun May 25 09:58:59 EDT 201…
## $ importance       <int> 1, 1, 1
## $ priority         <int> 0, 0, 0
## $ attachment_count <int> 2, 0, 0
## $ subject          <chr> "Test appointment", "contact name 1", "test dist list"
## $ body             <chr> "This is a complete test\r\n", "", ""
## $ headers          <chr> "", "", ""
## $ tostr            <chr> "PSTEmail: Test appointment\nImportance: 1\nMessage Class: IPM.Appointment\n\n\n\n\n{4096=Ta…
```

## freepst Metrics

| Lang | \# Files |  (%) | LoC |  (%) | Blank lines |  (%) | \# Lines |  (%) |
| :--- | -------: | ---: | --: | ---: | ----------: | ---: | -------: | ---: |
| R    |        7 | 0.88 | 114 | 0.92 |          25 | 0.56 |       51 | 0.61 |
| Rmd  |        1 | 0.12 |  10 | 0.08 |          20 | 0.44 |       32 | 0.39 |

## Code of Conduct

Please note that this project is released with a Contributor Code of
Conduct. By participating in this project you agree to abide by its
terms.
