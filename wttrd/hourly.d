module wttrd.hourly;

// Сводка погоды за три часа
struct Hourly {
	// точка росы (по Цельсию)
	float dewPointC;
	// точка росы (по Фаренгейту)
	float dewPointF;
	// чувствуется как (по Цельсию)
	float feelsLikeC;
	// чувствуется как (по Фаренгейту)
	float feelsLikeF;
	// тепловой индекс (по Цельсию) 
	float heatIndexC;
	// тепловой индекс (по Фаренгейту)
	float heatIndexF;
	// охлаждение ветром (по Цельсию)
	float windChillC;
	// охладение ветром (по Фаренгейту)
	float windChillF;
	// порывы ветра (в километрах/час)
	float windGustKmph;
	// порывы ветра (в милях/час)
	float windGustMiles;
	// вероятность появления тумана
	float chanceOfFog;
	// вероятность появления заморозков
	float chanceOfFrost;
	// вероятность появления высоких температур
	float chanceOfHighTemp;
	// вероятность появления облачной погоды
	float chanceOfOvercast;
	// вероятность появления дождя
	float chanceOfRain;
	// вероятность появления сухой погоды
	float chanceOfRemDry;
	// вероятность появления снега
	float chanceOfSnow;
	// вероятность появления солнечной погоды
	float chanceOfSunshine;
	// вероятность появления грозы
	float chanceOfThunder;
	// вероятность появления сильного ветра
	float chanceOfWindy;
	// облачность (в процентах)
	float cloudCover;
	// относительная влажность воздуха
	float humidity;
	// количество осадков (в дюймах)
	float precipInches;
	// количество осадков (в миллиметрах)
	float precipMM;
	// атмосферное давление (в миллибарах)
	float pressure;
	// атмосферное давление (в дюймах ртутного столба)
	float pressureInches;
	// температура (по Цельсию)
	float tempC;
	// температура (по Фаренгейту)
	float tempF;
	// время наблюдения за погодой
	float time;
	// индекс УФ-излучения
	float uvIndex;
	// видимость (в километрах)
	float visibility;
	// видимость (в милях)
	float visibilityMiles;
	// код погоды
	int weatherCode;
	// описание погоды
	string weatherDesc;
        // иконка погоды
	string weatherIconUrl;
	// направление ветра (по Розе Ветров)
	string windDir16Point;
	// азимут ветра (в градусах)
	float windDirDegree;
	// скорость ветра (в километрах/ч)
	float windSpeedKmph;
	// скорость ветра (в милях/ч)
	float windSpeedMiles;
}
