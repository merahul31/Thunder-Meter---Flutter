import 'package:flutter/material.dart';
import 'package:thunder_meter/screens/city_screen.dart';
import 'package:thunder_meter/utilities/constants.dart';
import 'package:thunder_meter/utilities/reusable_card.dart';
import 'package:thunder_meter/services/weather.dart';

class MainScreen extends StatefulWidget {
  MainScreen({this.locationWeather});

  final locationWeather;

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  WeatherModel weather = WeatherModel();
  int temperature;
  String weatherIcon;
  String cityName;
  String weatherDescription;
  double visibility;
  int pressure;
  double wind;
  int humidity;
  double latitude;
  double longitude;

  @override
  void initState() {
    super.initState();
    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        temperature = 0;
        weatherIcon = 'Error';
        weatherDescription = 'Error';
        visibility = 0.0;
        pressure = 0;
        wind = 0.0;
        humidity = 0;
        latitude = 0.0;
        longitude = 0.0;
        cityName = ' .... ';
        return;
      }
      var temp = weatherData['main']['temp'];
      temperature = temp.toInt();
      var condition = weatherData['weather'][0]['id'];
      weatherIcon = weather.getWeatherIcon(condition);
      cityName = weatherData['name'];
      weatherDescription = weatherData['weather'][0]['description'];
      visibility = ((weatherData['visibility']) / 1000).toDouble();
      pressure = weatherData['main']['pressure'];
      wind = weatherData['wind']['speed'];
      humidity = weatherData['main']['humidity'];
      latitude = weatherData['coord']['lat'];
      longitude = weatherData['coord']['lon'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: ListView(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () async {
                      var weatherData = await weather.getLocationWeather();
                      updateUI(weatherData);
                    },
                    child: Icon(
                      Icons.my_location,
                      size: 50.0,
                    ),
                  ),
                  Text(
                    cityName,
                    textAlign: TextAlign.center,
                    style: kCityNameStyle,
                  ),
                  FlatButton(
                    onPressed: () async {
                      var typedName = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return CityScreen();
                          },
                        ),
                      );
                      if (typedName != null) {
                        var weatherData =
                            await weather.getCityWeather(typedName);
                        updateUI(weatherData);
                      }
                    },
                    child: Icon(
                      Icons.add_location_alt,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 100.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    alignment: Alignment.topCenter,
                    width: (MediaQuery.of(context).size.width) * 2 / 3,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '$temperature°',
                        style: kTempTextStyle,
                      ),
                    ),
                  ),
                  Container(
                    width: (MediaQuery.of(context).size.width) / 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          weatherIcon,
                          style: kConditionTextStyle,
                        ),
                        Text(
                          weatherDescription,
                          style: kDescriptionTextStyle,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 100.0,
              ),
              SizedBox(
                height: 100.0,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Weather Details',
                  style: kDetailHeader,
                ),
              ),
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: ReusableCard(
                        cardChild: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                textBaseline: TextBaseline.alphabetic,
                                children: <Widget>[
                                  Text(
                                    '$temperature°',
                                    style: kDetailValue,
                                  ),
                                  Text(
                                    'c',
                                  ),
                                ],
                              ),
                              Text(
                                'Apparent temperature',
                                style: kDetailText,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: ReusableCard(
                        cardChild: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.baseline,
                                textBaseline: TextBaseline.alphabetic,
                                children: <Widget>[
                                  Text(
                                    '$visibility',
                                    style: kDetailValue,
                                  ),
                                  Text(' km'),
                                ],
                              ),
                              Text(
                                'Visibility',
                                style: kDetailText,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: ReusableCard(
                        cardChild: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.baseline,
                                textBaseline: TextBaseline.alphabetic,
                                children: <Widget>[
                                  Text(
                                    '$pressure',
                                    style: kDetailValue,
                                  ),
                                  Text(' hPa'),
                                ],
                              ),
                              Text(
                                'Air Pressure',
                                style: kDetailText,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: ReusableCard(
                        cardChild: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.baseline,
                                textBaseline: TextBaseline.alphabetic,
                                children: <Widget>[
                                  Text(
                                    '$wind',
                                    style: kDetailValue,
                                  ),
                                  Text(' km/h'),
                                ],
                              ),
                              Text(
                                'ENE wind',
                                style: kDetailText,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: ReusableCard(
                        cardChild: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.baseline,
                                textBaseline: TextBaseline.alphabetic,
                                children: <Widget>[
                                  Text(
                                    '$humidity',
                                    style: kDetailValue,
                                  ),
                                  Text('%'),
                                ],
                              ),
                              Text(
                                'Humidity',
                                style: kDetailText,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: ReusableCard(
                        cardChild: Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Lat: $latitude',
                                style: kDetailText,
                              ),
                              Text(
                                'Lon: $longitude',
                                style: kDetailText,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
