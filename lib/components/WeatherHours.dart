import 'package:flutter/cupertino.dart';
import 'package:flutter_weather/Weather/Weather.dart';
import 'package:flutter_weather/components/WeatherCard.dart';

class HourlyWeather extends StatelessWidget {
  final List<Weather> hourlyWeather;

  const HourlyWeather({Key key, this.hourlyWeather}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: hourlyWeather.length,
        itemBuilder: (context, i) {
          return WeatherCard(
            title:
                '${hourlyWeather[i].time.day}:${hourlyWeather[i].time.month}\n${hourlyWeather[i].time.hour}:${hourlyWeather[i].time.minute}0',
            temperature: hourlyWeather[i].temperature.toInt(),
            iconCode: hourlyWeather[i].iconCode,
            temperatureFontSize: 20,
          );
        },
      ),
    );
  }
}
