module wttrd.daily;

public {
	import wttrd.astronomy;
	import wttrd.hourly;
}

// Сводка погоды за сутки
struct Daily {
	// астрономические условия
	Astronomy astronomy;
	// средняя температура (по Цельсию)
	float avgTempC;
	// средняя температура (по Фаренгейту)
	float avgTempF;
	// дата
	string date;
	// отдельные сводки по каждым трем часам в сутках
	Hourly[8] hourly;
	// максимальная температура (по Цельсию)
	float maxTempC;
	// максимальная температура (по Фаренгейту)
	float maxTempF;
	// минимальная температура (по Цельсию)
	float minTempC;
	// минимальная температура (по Фаренгейту)
	float minTempF;
	// Количество солнечных часов
	float sunHour;
	// Количество снега (в сантиметрах)
	float totalSnowCm;
	// Индекс УФ-излучения
	float uvIndex;
}
