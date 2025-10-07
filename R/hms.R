# from hms
format_hms <- function(x) {
  units(x) <- "secs"
  xx <- decompose(x)

  ifelse(
    is.na(x),
    NA_character_,
    paste0(
      ifelse(xx$sign, "-", ""),
      format_hours(xx$hours),
      ":",
      format_two_digits(xx$minute_of_hour),
      ":",
      format_two_digits(xx$second_of_minute),
      format_tics(xx$tics)
    )
  )
}

format_hours <- function(x) {
  # Difference to hms: don't justify here
  format_two_digits(x)
}

format_two_digits <- function(x) {
  formatC(x, format = "f", digits = 0, width = 2, flag = "0")
}

format_tics <- function(x) {
  x <- x / TICS_PER_SECOND

  out <- format(x, scientific = FALSE, digits = SPLIT_SECOND_DIGITS + 1L)
  digits <- max(min(max(nchar(out) - 2), SPLIT_SECOND_DIGITS), 0)
  out <- formatC(x, format = "f", digits = digits)
  gsub("^0", "", out)
}

SPLIT_SECOND_DIGITS <- 6L

TICS_PER_SECOND <- 10^SPLIT_SECOND_DIGITS

SECONDS_PER_MINUTE <- 60

MINUTES_PER_HOUR <- 60

HOURS_PER_DAY <- 24

TICS_PER_MINUTE <- SECONDS_PER_MINUTE * TICS_PER_SECOND

TICS_PER_HOUR <- MINUTES_PER_HOUR * TICS_PER_MINUTE

TICS_PER_DAY <- HOURS_PER_DAY * TICS_PER_HOUR

days <- function(x) {
  trunc(x / TICS_PER_DAY)
}

hours <- function(x) {
  trunc(x / TICS_PER_HOUR)
}

hour_of_day <- function(x) {
  abs(hours(x) - days(x) * HOURS_PER_DAY)
}

minutes <- function(x) {
  trunc(x / TICS_PER_MINUTE)
}

minute_of_hour <- function(x) {
  abs(minutes(x) - hours(x) * MINUTES_PER_HOUR)
}

seconds <- function(x) {
  trunc(x / TICS_PER_SECOND)
}

second_of_minute <- function(x) {
  abs(seconds(x) - minutes(x) * SECONDS_PER_MINUTE)
}

tics <- function(x) {
  x
}

tic_of_second <- function(x) {
  abs(tics(x) - seconds(x) * TICS_PER_SECOND)
}

decompose <- function(x) {
  x <- unclass(x) * TICS_PER_SECOND

  # #140
  xr <- round(x)

  out <- list(
    sign = xr < 0 & !is.na(xr),
    hours = abs(hours(xr)),
    minute_of_hour = minute_of_hour(xr),
    second_of_minute = second_of_minute(xr),
    tics = tic_of_second(xr)
  )

  # #140: Make sure zeros are printed
  fake_zero <- (out$tics == 0) & (xr != x)
  out$tics[fake_zero] <- 0.25

  out
}
