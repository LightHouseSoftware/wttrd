module wttrd.weather;

public {
	import wttrd.daily;
}

// Сводка погоды за три дня
struct Weather {
	// свлжка за три дня
	Daily[3] daily;
}


// extract weather from wttr.in JSON json
auto weatherFor(string location) {
	import std.net.curl : get;

	import std.conv : to;
	import std.format : format;
	import std.json;
	
	enum string WTTR_QUERY = `https://wttr.in/%s?Q?m&format=j1&lang=en`;

	auto wttrContent = get(WTTR_QUERY.format(location))
		.parseJSON;

	auto fromJSON(T = string)(JSONValue json, string key) {
		static if (is(T : string))
			return json[key].str;
		else
			return json[key].str.to!T;
	}
	
	Weather weather;

	foreach (i, e; wttrContent["weather"].array)
	{
		// данные по погоде на день
		Daily daily;
		
		// Астрономические условия
		Astronomy astronomy;

		with (astronomy)
		{
			auto q = e["astronomy"][0];

			moonIllumination = fromJSON!float(q, "moon_illumination");
			moonPhase = fromJSON(q, "moon_phase");
			moonrise = fromJSON(q, "moonrise");
			moonset = fromJSON(q, "moonset");
			sunrise = fromJSON(q, "sunrise");
			sunset = fromJSON(q, "sunset");
		}

		daily.astronomy = astronomy;
		
		with (daily)
		{
			avgTempC = fromJSON!float(e, "avgtempC");
			avgTempF = fromJSON!float(e, "avgtempF");
			date = fromJSON(e, "date");
			maxTempC = fromJSON!float(e, "maxtempC");
			maxTempF = fromJSON!float(e, "maxtempF");
			minTempC = fromJSON!float(e, "mintempC");
			minTempF = fromJSON!float(e, "mintempF");
			sunHour = fromJSON!float(e, "sunHour");
			totalSnowCm = fromJSON!float(e, "totalSnow_cm");
			uvIndex = fromJSON!float(e, "uvIndex");

			foreach (j, w; e["hourly"].array)
			{
				Hourly hourly;

				with (hourly)
				{
					dewPointC = fromJSON!float(w, "DewPointC");
					dewPointF = fromJSON!float(w, "DewPointF");
					feelsLikeC = fromJSON!float(w, "FeelsLikeC");
					feelsLikeF = fromJSON!float(w, "FeelsLikeF");
					heatIndexC = fromJSON!float(w, "HeatIndexC");
					heatIndexF = fromJSON!float(w, "HeatIndexF");
					windChillC = fromJSON!float(w, "WindChillC");
					windChillF = fromJSON!float(w, "WindChillF");
					windGustKmph = fromJSON!float(w, "WindGustKmph");
					windGustMiles = fromJSON!float(w, "WindGustMiles");
					chanceOfFog = fromJSON!float(w, "chanceoffog");
					chanceOfFrost = fromJSON!float(w, "chanceoffrost");
					chanceOfHighTemp = fromJSON!float(w, "chanceofhightemp");
					chanceOfOvercast = fromJSON!float(w, "chanceofovercast");
					chanceOfRain = fromJSON!float(w, "chanceofrain");
					chanceOfRemDry = fromJSON!float(w, "chanceofremdry");
					chanceOfSnow = fromJSON!float(w, "chanceofsnow");
					chanceOfSunshine = fromJSON!float(w, "chanceofsunshine");
					chanceOfThunder = fromJSON!float(w, "chanceofthunder");
					chanceOfWindy = fromJSON!float(w, "chanceofwindy");
					cloudCover = fromJSON!float(w, "cloudcover");
					humidity = fromJSON!float(w, "humidity");
					precipInches = fromJSON!float(w, "precipInches");
					precipMM = fromJSON!float(w, "precipMM");
					pressure = fromJSON!float(w, "pressure");
					pressureInches = fromJSON!float(w, "pressureInches");
					tempC = fromJSON!float(w, "tempC");
					tempF = fromJSON!float(w, "tempF");
					time = fromJSON!float(w, "time");
					uvIndex = fromJSON!float(w, "uvIndex");
					visibility = fromJSON!float(w, "visibility");
					visibilityMiles = fromJSON!float(w, "visibilityMiles");
					weatherCode = fromJSON!int(w, "weatherCode");
					weatherDesc = w["weatherDesc"][0]["value"].str;
					weatherIconUrl = w["weatherIconUrl"][0]["value"].str;
					windDir16Point = fromJSON(w, "winddir16Point");
					windDirDegree = fromJSON!float(w, "winddirDegree");
					windSpeedKmph = fromJSON!float(w, "windspeedKmph");
					windSpeedMiles = fromJSON!float(w, "windspeedMiles");
				}

				daily.hourly[j] = hourly;
			}
		}
		
		weather.daily[i] = daily;
	}
	
	return weather;
}
