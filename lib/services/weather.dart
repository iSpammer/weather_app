import 'location.dart';
import 'networking.dart';

const _apiKey = '0e5e434a8f9778e596ff155231d12d9a';
const _openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';
const _unit = "metric";

class WeatherModel {
  Future<dynamic> getCityWeather(String city) async {
    var url = "$_openWeatherMapURL/?q=$city&appid=$_apiKey&units=$_unit";
    var weatherData = await NetowrkHelper(url: url).getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = new Location();
    await location.getCurrentLocation();
    var weatherData = await NetowrkHelper(
            url:
                "$_openWeatherMapURL?lat=${location.getLongitude()}&lon=${location.getLatitude()}&appid=$_apiKey&units=$_unit")
        .getData();
    return weatherData;
  }

  String getWeatherIcon(var condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(var temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
