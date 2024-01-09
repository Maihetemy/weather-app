import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/views/home_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: BlocBuilder<GetWeatherCubit, WeatherState>(
        builder: (context, state) {
          return Builder(builder: (context) {
            return MaterialApp(
              theme: ThemeData(
                primarySwatch: getThemeColors(
                  BlocProvider.of<GetWeatherCubit>(context)
                      .weatherModle
                      ?.weatherCondition,
                ),
              ),
              debugShowCheckedModeBanner: false,
              home: HomeView(),
            );
          });
        },
      ),
    );
  }
}
