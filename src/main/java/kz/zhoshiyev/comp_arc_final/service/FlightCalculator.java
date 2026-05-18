package kz.zhoshiyev.comp_arc_final.service;

public class FlightCalculator {
    private static final double EARTH_RADIUS_KM = 6371.0;
    private static final double AVG_SPEED_KMH = 850.0; // средняя скорость джета

    // формула Haversine — считает расстояние между двумя точками на Земле
    public static double distanceKm(double lat1, double lon1, double lat2, double lon2) {
        double dLat = Math.toRadians(lat2 - lat1);
        double dLon = Math.toRadians(lon2 - lon1);

        double a = Math.sin(dLat / 2) * Math.sin(dLat / 2)
                + Math.cos(Math.toRadians(lat1)) * Math.cos(Math.toRadians(lat2))
                * Math.sin(dLon / 2) * Math.sin(dLon / 2);

        double c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
        return EARTH_RADIUS_KM * c;
    }

    // считает часы полёта
    public static double flightHours(double lat1, double lon1, double lat2, double lon2) {
        double distance = distanceKm(lat1, lon1, lat2, lon2);
        return distance / AVG_SPEED_KMH;
    }

    // считает итоговую цену
    public static double totalPrice(double lat1, double lon1,
                                    double lat2, double lon2,
                                    double pricePerHour) {
        double hours = flightHours(lat1, lon1, lat2, lon2);
        return Math.ceil(hours) * pricePerHour; // округляем часы вверх
    }
}
