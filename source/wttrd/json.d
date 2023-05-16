module wttrd.json;

public {
	import std.format : format;
	import std.json;
	
	import std.net.curl;
	
	import wttrd.daily;
	import wttrd.weather;
}


private {
	import std.conv : to;
	
	auto fromJSON(T = string)(JSONValue json, string key) {
		static if (is(T : string))
			return json[key].str;
		else
			return json[key].str.to!T;
	}

	alias JSON2float  = fromJSON!float;
	alias JSON2int    = fromJSON!int;
	alias JSON2string = fromJSON;
	
	// query to get data from wttr.in in JSON format wuth 3 day and current conditioon data
	enum WTTR_QUERY = `"https://wttr.in/%s?Q?m&format=j1&lang=en"`;
}


/// Parse wttr.in JSON to Weather structure
auto weatherFromWttrJSON(JSONValue wttrResponse) {
	Weather weather;
	
	foreach (i, e; wttrResponse["weather"].array)
	{
		// данные по погоде на день
		Daily daily;
		
		// Астрономические условия
		Astronomy astronomy;

		with (astronomy)
		{
			auto q = e["astronomy"][0];

			moonIllumination = JSON2float(q, "moon_illumination");
			moonPhase = JSON2string(q, "moon_phase");
			moonrise = JSON2string(q, "moonrise");
			moonset = JSON2string(q, "moonset");
			sunrise = JSON2string(q, "sunrise");
			sunset = JSON2string(q, "sunset");
		}

		daily.astronomy = astronomy;
		
		with (daily)
		{
			avgTempC = JSON2float(e, "avgtempC");
			avgTempF = JSON2float(e, "avgtempF");
			date = JSON2string(e, "date");
			maxTempC = JSON2float(e, "maxtempC");
			maxTempF = JSON2float(e, "maxtempF");
			minTempC = JSON2float(e, "mintempC");
			minTempF = JSON2float(e, "mintempF");
			sunHour = JSON2float(e, "sunHour");
			totalSnowCm = JSON2float(e, "totalSnow_cm");
			uvIndex = JSON2float(e, "uvIndex");

			foreach (j, w; e["hourly"].array)
			{
				Hourly hourly;

				with (hourly)
				{
					dewPointC = JSON2float(w, "DewPointC");
					dewPointF = JSON2float(w, "DewPointF");
					feelsLikeC = JSON2float(w, "FeelsLikeC");
					feelsLikeF = JSON2float(w, "FeelsLikeF");
					heatIndexC = JSON2float(w, "HeatIndexC");
					heatIndexF = JSON2float(w, "HeatIndexF");
					windChillC = JSON2float(w, "WindChillC");
					windChillF = JSON2float(w, "WindChillF");
					windGustKmph = JSON2float(w, "WindGustKmph");
					windGustMiles = JSON2float(w, "WindGustMiles");
					chanceOfFog = JSON2float(w, "chanceoffog");
					chanceOfFrost = JSON2float(w, "chanceoffrost");
					chanceOfHighTemp = JSON2float(w, "chanceofhightemp");
					chanceOfOvercast = JSON2float(w, "chanceofovercast");
					chanceOfRain = JSON2float(w, "chanceofrain");
					chanceOfRemDry = JSON2float(w, "chanceofremdry");
					chanceOfSnow = JSON2float(w, "chanceofsnow");
					chanceOfSunshine = JSON2float(w, "chanceofsunshine");
					chanceOfThunder = JSON2float(w, "chanceofthunder");
					chanceOfWindy = JSON2float(w, "chanceofwindy");
					cloudCover = JSON2float(w, "cloudcover");
					humidity = JSON2float(w, "humidity");
					precipInches = JSON2float(w, "precipInches");
					precipMM = JSON2float(w, "precipMM");
					pressure = JSON2float(w, "pressure");
					pressureInches = JSON2float(w, "pressureInches");
					tempC = JSON2float(w, "tempC");
					tempF = JSON2float(w, "tempF");
					time = JSON2float(w, "time");
					uvIndex = JSON2float(w, "uvIndex");
					visibility = JSON2float(w, "visibility");
					visibilityMiles = JSON2float(w, "visibilityMiles");
					weatherCode = JSON2int(w, "weatherCode");
					weatherDesc = w["weatherDesc"][0]["value"].str;
					weatherIconUrl = w["weatherIconUrl"][0]["value"].str;
					windDir16Point = JSON2string(w, "winddir16Point");
					windDirDegree = JSON2float(w, "winddirDegree");
					windSpeedKmph = JSON2float(w, "windspeedKmph");
					windSpeedMiles = JSON2float(w, "windspeedMiles");
				}

				daily.hourly[j] = hourly;
			}
		}
		
		weather.daily[i] = daily;
	}
	
	return weather;
}


/// Get weather from wttr.in by specifying location
auto weatherFromWttr(string location) {
	return WTTR_QUERY
			.format(location)
			.get
			.parseJSON
			.weatherFromWttrJSON;
}
