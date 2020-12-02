

import 'package:bloc/bloc.dart';
import 'package:flutter_weather/Weather/Weather.dart';
import 'package:flutter_weather/events/WeatherEvent.dart';
import 'package:flutter_weather/services/WeatherService.dart';
import 'package:flutter_weather/states/WeatherState.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final String cityName;
  WeatherBloc(this.cityName) : super(null) {
    add(WeatherRequested(city: cityName));
  }

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    if (event is WeatherRequested) {
      yield WeatherLoadInProgress();
      try {
        final Weather weather =
        await WeatherService.fetchCurrentWeather(query: event.city);
        final List<Weather> hourlyWeather =
        await WeatherService.fetchHourlyWeather(query: event.city);
        yield WeatherLoadSuccess(
            weather: weather, hourlyWeather: hourlyWeather);
      } catch (_) {
        yield WeatherLoadFailure();
      }
    }
  }
}