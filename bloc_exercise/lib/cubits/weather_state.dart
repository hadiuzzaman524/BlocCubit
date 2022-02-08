import 'package:bloc_exercise/data/model/weather.dart';

class WeatherState {

  WeatherState init() {
    return WeatherState();
  }
  WeatherState clone() {
    return WeatherState();
  }

}

class WeatherInitial extends WeatherState{
   WeatherInitial();
}

class WeatherLoading extends WeatherState{
  WeatherLoading();
}

class WeatherLoaded extends WeatherState{

  final Weather weather;
  WeatherLoaded({required this.weather});
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) return true;
    return other is WeatherLoaded && other.weather==weather;
  }
  @override
  int get hashCode => weather.hashCode;

}

class WeatherError extends WeatherState{

  final String message;
  WeatherError({required this.message});
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) return true;
    return other is WeatherError && other.message==message;
  }
  @override
  int get hashCode => message.hashCode;

}