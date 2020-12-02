import 'package:flutter/cupertino.dart';
import 'package:flutter_weather/Weather/Weather.dart';
import 'package:flutter_weather/components/WeatherCard.dart';
import 'package:flutter_weather/components/WeatherHours.dart';

class MainScreenWrapper extends StatelessWidget{
  final Weather weather;
  final List<Weather> hourlyWeather;

  const MainScreenWrapper({Key key, this.weather, this.hourlyWeather}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            weather.cityName,
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          Text(
            '${weather.description}'
          ),
          Spacer(),
          WeatherCard(
            title: "Now",
            temperature: weather.temperature,
            iconCode: weather.iconCode,
            temperatureFontSize: 64,
            iconScale: 1,
          ),
          Spacer(),
          HourlyWeather(hourlyWeather: this.hourlyWeather,)
        ],
      ),
    );
  }




}