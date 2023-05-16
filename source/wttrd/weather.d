module wttrd.weather;

public {
	import wttrd.daily;
}

// Сводка погоды за три дня
struct Weather {
	// свлжка за три дня
	Daily[3] daily;
}
