import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/WeatherInfo.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Provider pattern',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (context) => WeatherInfo(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text('Provider pattern'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              MySpecialHeading(),
              MySpecialContent(),
            ],
          ),
        ),
        floatingActionButton: MyFloatingActionButton(),
      ),
    );
  }
}

class MySpecialHeading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var weatherInfo = Provider.of<WeatherInfo>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        weatherInfo.tempType,
        style: TextStyle(
          fontSize: 30,
          color: getColor(weatherInfo),
        ),
      ),
    );
  }
}

class MySpecialContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var weatherInfo = Provider.of<WeatherInfo>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        weatherInfo.tempVal.toString(),
        style: TextStyle(
          fontSize: 21,
        ),
      ),
    );
  }
}

Color getColor(WeatherInfo info) {
  return info.tempType == "celcius" ? Colors.green : Colors.red;
}

class MyFloatingActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var weatherInfo = Provider.of<WeatherInfo>(context);
    return FloatingActionButton(
      backgroundColor: getColor(weatherInfo),
      child: Icon(Icons.change_history),
      tooltip: 'Change Type',
      onPressed: () {
        String newWeatherType =
            weatherInfo.tempType == "celcius" ? "far" : "celcius";
        weatherInfo.temperatureType = newWeatherType;
        double newWeatherVal = weatherInfo.tempType != "celcius"
            ? (weatherInfo.tempVal * 9 / 5) + 32
            : (weatherInfo.tempVal - 32) * 5 / 9;
        weatherInfo.temperatureValue = newWeatherVal;
      },
    );
  }
}
