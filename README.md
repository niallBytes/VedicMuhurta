# VedicDateTime: New Feature – Vedic Muhurta Calculation

## Overview

The **vedic_muhurta** function is a new addition to the VedicDateTime package. It computes the 30 muhurta periods for a given day based on the sunrise times of the current day and the next day. In Vedic tradition, dividing the day (from sunrise to sunrise) into 30 equal parts is essential for determining auspicious time segments for rituals, events, and detailed time series analysis.

## Why This Feature Is Important

- **Cultural Relevance:**  
  In traditional Vedic timekeeping, muhurtas are used to schedule important activities and rituals.
- **Precision:**  
  The function calculates muhurtas dynamically based on actual sunrise times, ensuring accurate divisions that reflect natural day-length variations.
- **Time-Series Analysis:**  
  Researchers can now analyze events in terms of traditional time segments, opening up new avenues for natural time-series pattern discovery.

## Usage

1. **Installation:**  
   ```r
   install.packages("VedicDateTime")

2. **Loading the Function:**
   ```r
   library(VedicDateTime)
   source("R/vedic_muhurta.R")  # Only necessary during development; this should be part of the package in production.

## Function Implementation
   The function vedic_muhurta() takes two arguments:

   **jd :** Julian Day Number (JD) of the date.
   
   **place :** A numeric vector containing latitude, longitude, and timezone offset of the location.

## Example 
   ```r
   # Convert a Gregorian date to Julian day number
   jd_example <- gregorian_to_jd(8, 9, 2022)

   # Define the location (latitude, longitude, timezone offset)
   place <- c(15.34, 75.13, +5.5)

   # Compute the muhurta periods
   muhurtas <- vedic_muhurta(jd_example, place)
   print(muhurtas)
   ```
## Output
   The function returns a data frame with columns for the muhurta number, start time, and end time (formatted as HH:MM:SS).

## Conclusion 
   This new feature is designed to integrate seamlessly with the existing functions in VedicDateTime, enhancing its 
   functionality and offering a culturally rich tool for both traditional and modern time series analysis.







