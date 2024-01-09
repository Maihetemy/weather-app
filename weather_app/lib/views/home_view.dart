import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/views/search_page.dart';
import 'package:weather_app/widgets/no_weather_body.dart';
import 'package:weather_app/widgets/weather_info_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Colors.amber,
        title: const Text('Weather App'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SearchPage()),
              );
            },
            icon: const Icon(
              Icons.search,
              size: 28,
            ),
          ),
        ],
      ),
      body: BlocBuilder<GetWeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is InitialweatherState) {
            return const NoWeatherBody();
          } else if (state is WeatherLoadedState) {
            return const WeatherInfoBody();
          } else {
            return const Text('oops there was an error. Try later !');
          }
        },
      ),
    );
  }
}

MaterialColor getThemeColors(String? condition) {
  if (condition == null) return Colors.blue;
  if (condition == "Sunny" || condition == "Clear") {
    return Colors.yellow;
  } else if (condition == "Partly cloudy" ||
      condition == "Cloudy" ||
      condition == "Overcast" ||
      condition == "Fog" ||
      condition == "Freezing fog") {
    return Colors.grey;
  } else if (condition == "Mist" ||
      condition == "Patchy rain possible" ||
      condition == "Patchy snow possible" ||
      condition == "Patchy sleet possible" ||
      condition == "Patchy freezing drizzle possible") {
    return Colors.blueGrey;
  } else if (condition == "Thundery outbreaks possible" ||
      condition == "Blowing snow" ||
      condition == "Blizzard") {
    return Colors.deepPurple;
  } else if (condition == "Patchy light drizzle" ||
      condition == "Light drizzle" ||
      condition == "Freezing drizzle" ||
      condition == "Heavy freezing drizzle" ||
      condition == "Patchy light rain" ||
      condition == "Light rain" ||
      condition == "Moderate rain at times" ||
      condition == "Moderate rain" ||
      condition == "Heavy rain at times" ||
      condition == "Heavy rain" ||
      condition == "Light freezing rain" ||
      condition == "Moderate or heavy freezing rain") {
    return Colors.blue;
  } else if (condition == "Light sleet" ||
      condition == "Moderate or heavy sleet") {
    return Colors.teal;
  } else if (condition == "Patchy light snow" ||
      condition == "Light snow" ||
      condition == "Patchy moderate snow" ||
      condition == "Moderate snow" ||
      condition == "Patchy heavy snow" ||
      condition == "Heavy snow") {
    return Colors.indigo;
  } else if (condition == "Ice pellets" ||
      condition == "Light rain shower" ||
      condition == "Moderate or heavy rain shower" ||
      condition == "Torrential rain shower" ||
      condition == "Light sleet showers" ||
      condition == "Moderate or heavy sleet showers" ||
      condition == "Light snow showers" ||
      condition == "Moderate or heavy snow showers" ||
      condition == "Light showers of ice pellets" ||
      condition == "Moderate or heavy showers of ice pellets" ||
      condition == "Patchy light rain with thunder" ||
      condition == "Moderate or heavy rain with thunder" ||
      condition == "Patchy light snow with thunder" ||
      condition == "Moderate or heavy snow with thunder") {
    return Colors.deepOrange;
  } else {
    return Colors.blue;
  }
}
