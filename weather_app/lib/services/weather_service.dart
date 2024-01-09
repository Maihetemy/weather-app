import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  final Dio dio;

  WeatherService(this.dio);

  final String baseUrl = 'http://api.weatherapi.com/v1';
  final String apiKey = 'c9b78bcb02654430b9b180345232311';
  Future<WeatherModle> getCurrentWeather({required String cityName}) async {
    try {
      Response response = await dio.get(
          '$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1&aqi=no&alerts=no');
      WeatherModle weatherModle = WeatherModle.fromJson(response.data);
      return weatherModle;
    } on DioException catch (e) {
      final String errorMessage = e.response?.data['error']['message'] ??
          'oops there was an error. Try later !';
      throw Exception(errorMessage);
    } catch (e) {
      throw Exception('oops there was an error. Try later !');
    }
  }
}
