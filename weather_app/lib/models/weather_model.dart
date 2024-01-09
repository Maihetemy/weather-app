class WeatherModle {
  final String cityName, weatherCondition;
  final DateTime dateTime;
  String? image;
  final double temp, maxTemp, minTemp;

  WeatherModle(
      {required this.cityName,
      required this.dateTime,
      required this.image,
      required this.temp,
      required this.maxTemp,
      required this.minTemp,
      required this.weatherCondition});
  factory WeatherModle.fromJson(json) {
    return WeatherModle(
      cityName: json['location']['name'],
      dateTime: DateTime.parse(json['current']['last_updated']),
      image: json['forecast']['forecastday'][0]['day']['condition']['icon'],
      temp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
      maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
      weatherCondition: json['forecast']['forecastday'][0]['day']['condition']
          ['text'],
    );
  }
}
