module wttrd.conditions;

// текущая погодная сводка
struct CurrentCondition {
	// чувствуется как (по Цельсию)
	float feelsLikeC;
	// чувствуется как (по Фаренгейту)
	float feelsLikeF;
	// облачность (в процентах)
	float cloudCover;
	// относительная влажность
	float humidity;
	// локальное время обзора
	string localObsDateTime;
	// время обзора
	string observationTime;
	// осадки (в дюймах)
	float precipInches;
	// осадки (в миллиметрах)
	float precipMM;
	// давление (в миллибарах)
	float pressure;
	// давление (в дюймах ртутного столба)
	float pressureInches;
	// температура (по Цельсию)
	float tempC;
	// температура (по Фаренгейту)
	float tempF;
	// индекс УФ-излучения
	float uvIndex;
	// видимость (в километрах)
	float visibility;
	// видимость (в милях)
	float visibilityMiles;
	// код погоды
	int weatherCode;
	// текстовое описание погоды
	string weatherDesc;
	// адрес иконки для погоды
	string weatherIconUrl;
	// направление ветра по Розе Ветров
	string windDir16Point;
	// азимут ветра (в градусах)
	float windDirDegree;
	// скорость ветра (в километрах в час)
	float windSpeedKmph;
	// скорость ветра (в милях в час)
	float windSpeedMiles;
}
