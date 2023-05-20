# wttrd
`wttrd` - Minimal library for working with the weather API of wttr.in website. This library provides a minimal set of structures for parsing JSON data received from the website, as well as a set of functions for translating JSON into real D structures. The functionality may be expanded in the future, but most likely, this is the minimal set and we will stop at that.

Here is a basic example for retrieving weather forecast for three days (current day + two days after) and getting the current weather summary:

```d
#!/usr/bin/env dub
/+ dub.sdl:
    dependency "wttrd" version="~main"
+/
import std.stdio;

import wttrd;

void main()
{
    // three days weather forecast
    auto w = weatherFromWttr("Yaroslavl");
    
    // current conditions
    auto c = conditionFromWttr("Yaroslavl");

    w.writeln;
    c.writeln;
}
```
Here is the resulting output from this example:

```
Weather([Daily(Astronomy(0, "Waxing Crescent", "03:44 AM", "10:28 PM", "03:50 AM", "08:46 PM"), 12, 53, "2023-05-20", [Hourly(4, 40, 6, 43, 8, 47, 6, 43, 28, 17, 0, 0, 0, 43, 0, 86, 0, 81, 0, 0, 46, 76, 0, 0, 1026, 30, 8, 47, 0, 1, 10, 6, 116, "Partly cloudy", "", "NNW", 337, 15, 9), Hourly(4, 39, 6, 42, 8, 47, 6, 42, 25, 16, 0, 0, 0, 32, 0, 90, 0, 87, 0, 0, 44, 74, 0, 0, 1026, 30, 8, 47, 300, 1, 10, 6, 116, "Partly cloudy", "", "NNW", 343, 16, 10), Hourly(5, 41, 6, 43, 9, 48, 6, 43, 21, 13, 0, 0, 0, 48, 0, 90, 0, 84, 0, 0, 46, 77, 0, 0, 1026, 30, 9, 48, 600, 3, 10, 6, 116, "Partly cloudy", "", "N", 349, 15, 9), Hourly(6, 43, 11, 51, 12, 54, 11, 51, 22, 13, 0, 0, 0, 46, 0, 93, 0, 77, 0, 0, 30, 65, 0, 0, 1026, 30, 12, 54, 900, 4, 10, 6, 116, "Partly cloudy", "", "N", 3, 18, 11), Hourly(6, 43, 17, 62, 17, 62, 17, 62, 26, 16, 0, 0, 0, 83, 0, 82, 0, 14, 0, 0, 100, 50, 0, 0, 1026, 30, 17, 62, 1200, 4, 10, 6, 122, "Overcast", "", "N", 6, 22, 14), Hourly(7, 45, 16, 60, 16, 60, 16, 60, 22, 14, 0, 0, 0, 43, 0, 89, 0, 78, 0, 0, 56, 58, 0, 0, 1025, 30, 16, 60, 1500, 5, 10, 6, 116, "Partly cloudy", "", "N", 2, 17, 11), Hourly(8, 47, 13, 55, 13, 56, 13, 55, 14, 9, 0, 0, 0, 93, 91, 0, 0, 0, 0, 0, 98, 73, 0, 0.2, 1026, 30, 13, 56, 1800, 3, 2, 1, 266, "Light drizzle", "", "NNW", 333, 9, 5), Hourly(8, 46, 11, 52, 12, 53, 11, 52, 17, 10, 0, 0, 0, 91, 0, 93, 0, 18, 0, 0, 96, 77, 0, 0, 1025, 30, 12, 53, 2100, 1, 10, 6, 122, "Overcast", "", "N", 1, 10, 6)], 17, 62, 8, 46, 15.3, 0, 3), Daily(Astronomy(2, "Waxing Crescent", "04:03 AM", "11:47 PM", "03:48 AM", "08:48 PM"), 13, 55, "2023-05-21", [Hourly(9, 47, 9, 48, 11, 51, 9, 48, 20, 12, 13, 0, 0, 80, 86, 0, 0, 0, 0, 0, 100, 88, 0, 0.5, 1024, 30, 11, 51, 0, 1, 2, 1, 266, "Light drizzle", "", "NNE", 27, 13, 8), Hourly(10, 50, 9, 47, 11, 51, 9, 47, 24, 15, 0, 0, 0, 87, 60, 0, 0, 0, 0, 0, 100, 96, 0, 0.7, 1024, 30, 11, 51, 300, 1, 2, 1, 266, "Light drizzle", "", "ENE", 60, 16, 10), Hourly(10, 51, 9, 48, 11, 52, 9, 48, 23, 14, 0, 0, 0, 85, 76, 0, 0, 0, 0, 0, 100, 96, 0, 0.7, 1024, 30, 11, 52, 600, 3, 2, 1, 266, "Light drizzle", "", "ENE", 72, 15, 10), Hourly(11, 51, 10, 50, 11, 52, 10, 50, 18, 11, 0, 0, 0, 91, 75, 0, 0, 0, 0, 0, 100, 96, 0.1, 2, 1025, 30, 11, 52, 900, 3, 9, 5, 296, "Light rain", "", "ENE", 67, 12, 7), Hourly(12, 53, 12, 53, 13, 55, 12, 53, 16, 10, 0, 0, 0, 82, 84, 0, 0, 0, 0, 0, 100, 93, 0, 0.6, 1025, 30, 13, 55, 1200, 3, 2, 1, 266, "Light drizzle", "", "NE", 53, 11, 7), Hourly(12, 54, 16, 60, 16, 60, 16, 60, 14, 9, 0, 0, 0, 83, 0, 81, 0, 13, 0, 0, 83, 80, 0, 0, 1025, 30, 16, 60, 1500, 4, 10, 6, 119, "Cloudy", "", "ESE", 112, 12, 7), Hourly(13, 55, 18, 64, 18, 64, 18, 64, 12, 7, 0, 0, 0, 86, 59, 0, 0, 0, 0, 0, 87, 70, 0, 0.2, 1024, 30, 18, 64, 1800, 4, 9, 5, 176, "Patchy rain possible", "", "E", 93, 10, 6), Hourly(11, 52, 12, 53, 13, 55, 12, 53, 21, 13, 0, 0, 0, 0, 0, 93, 0, 94, 0, 0, 22, 91, 0, 0, 1025, 30, 13, 55, 2100, 1, 10, 6, 113, "Clear", "", "E", 84, 10, 6)], 18, 64, 10, 51, 13.5, 0, 3), Daily(Astronomy(6, "Waxing Crescent", "04:36 AM", "No moonset", "03:46 AM", "08:49 PM"), 17, 62, "2023-05-22", [Hourly(10, 51, 10, 50, 11, 52, 10, 50, 20, 12, 1, 0, 0, 80, 80, 0, 0, 0, 0, 0, 83, 94, 0, 0.1, 1025, 30, 11, 52, 0, 1, 2, 1, 143, "Mist", "", "ENE", 74, 9, 6), Hourly(12, 53, 12, 53, 12, 53, 12, 53, 10, 6, 0, 0, 0, 91, 79, 0, 0, 0, 0, 0, 77, 97, 0.1, 1.4, 1025, 30, 12, 53, 300, 1, 9, 5, 296, "Light rain", "", "SE", 136, 6, 4), Hourly(12, 54, 13, 55, 13, 55, 13, 55, 13, 8, 0, 0, 0, 90, 69, 0, 0, 0, 0, 0, 67, 95, 0, 0.3, 1025, 30, 13, 55, 600, 3, 5, 3, 263, "Patchy light drizzle", "", "E", 83, 8, 5), Hourly(13, 56, 17, 63, 17, 63, 17, 63, 21, 13, 0, 0, 0, 84, 63, 0, 0, 0, 0, 0, 81, 76, 0, 0.5, 1025, 30, 17, 63, 900, 4, 9, 5, 176, "Patchy rain possible", "", "ESE", 115, 17, 11), Hourly(12, 53, 21, 69, 21, 69, 21, 69, 26, 16, 0, 0, 0, 39, 0, 91, 0, 73, 0, 0, 57, 57, 0, 0, 1025, 30, 21, 69, 1200, 6, 10, 6, 116, "Partly cloudy", "", "SE", 127, 23, 14), Hourly(13, 55, 25, 76, 25, 76, 22, 72, 24, 15, 0, 0, 0, 31, 0, 88, 0, 74, 0, 0, 32, 56, 0, 0, 1025, 30, 22, 72, 1500, 6, 10, 6, 116, "Partly cloudy", "", "ESE", 113, 21, 13), Hourly(13, 55, 20, 69, 20, 69, 20, 69, 27, 17, 0, 0, 0, 0, 0, 87, 0, 93, 0, 0, 25, 63, 0, 0, 1024, 30, 20, 69, 1800, 6, 10, 6, 113, "Sunny", "", "ESE", 113, 19, 12), Hourly(11, 53, 16, 60, 16, 60, 16, 60, 33, 21, 0, 0, 0, 0, 0, 87, 0, 86, 0, 0, 22, 76, 0, 0, 1025, 30, 16, 60, 2100, 1, 10, 6, 113, "Clear", "", "ESE", 108, 16, 10)], 22, 72, 11, 52, 15.5, 0, 4)])
CurrentCondition(8, 46, 30, 73, "2023-05-20 08:15 AM", "05:15 AM", 0, 0, 1026, 30, 10, 50, 4, 10, 6, 116, "Partly cloudy", "", "N", 357, 17, 11)
```
After receiving the data and parsing it into the indicated structures, you can extract the necessary information from them (the names of the information blocks match their names in wttr.in, but the names are given in camelCase) and use it further.
