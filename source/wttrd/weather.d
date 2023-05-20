module wttrd.weather;

public {
	import wttrd.daily;
}

// Сводка погоды за три дня
struct Weather {
	// сводка за три дня
	Daily[3] daily;
}
