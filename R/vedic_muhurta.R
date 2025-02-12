# Load the necessary package
library(VedicDateTime)

#' Calculate Vedic Muhurtas for a given date and location
#'
#' This function divides the time between two consecutive sunrises
#' into 30 equal Muhurtas.
#'
#' @param jd Julian Day (JD) number of the given date
#' @param place A numeric vector containing latitude, longitude,
#' and timezone offset
#' @return A data frame containing 30 Muhurtas with their respective
#' start and end times
#' @examples
#' jd_example <- gregorian_to_jd(8, 9, 2022)
#' place <- c(15.34, 75.13, 5.5)
#' vedic_muhurta(jd_example, place)
vedic_muhurta <- function(jd, place) {

  # Fetch sunrise time for the given Julian Day
  sunrise_today <- VedicDateTime::sunrise(jd, place)

  # Fetch sunrise time for the next Julian Day
  sunrise_tomorrow <- VedicDateTime::sunrise(jd + 1, place)

  # Convert sunrise times to Julian Day format
  jd_sunrise_today <- sunrise_today$jd_sunrise
  jd_sunrise_tomorrow <- sunrise_tomorrow$jd_sunrise

  # Compute total duration between two sunrises in seconds
  duration_seconds <- (jd_sunrise_tomorrow - jd_sunrise_today) * 86400

  # Compute duration of one Muhurta (1/30th of the total time) in seconds
  muhurta_duration <- duration_seconds / 30

  # Generate 30 Muhurtas
  muhurtas <- data.frame(
    Muhurta = 1:30,
    Start = format(jd_to_time(
      jd_sunrise_today + (0:29) * muhurta_duration / 86400
    )),
    End = format(jd_to_time(
      jd_sunrise_today + (1:30) * muhurta_duration / 86400
    ))
  )

  # Return the formatted Muhurta timings
  return(muhurtas)
}

#' Convert Julian Day to formatted time string (HH:MM:SS)
#'
#' @param jd Julian Day number
#' @return Formatted time string in local time zone
jd_to_time <- function(jd) {

  # Convert Julian Day to POSIXct (R datetime format)
  datetime <- as.POSIXct(
    (jd - 2440587.5) * 86400, origin = "1970-01-01", tz = "UTC"
  )

  # Return time in HH:MM:SS format
  return(format(datetime, "%H:%M:%S"))
}
