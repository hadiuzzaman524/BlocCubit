import 'package:bloc/bloc.dart';
import 'package:bloc_exercise/data/weather_repository.dart';
import 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState>{

  final WeatherRepository _weatherRepository;
  WeatherCubit(this._weatherRepository) : super(WeatherInitial());


  Future<void> getWeather(String cityName) async{
    try{
      emit(WeatherLoading());
      final weather= await _weatherRepository.fetchWeather(cityName);
      emit(WeatherLoaded(weather: weather));

    } on NetworkException{
      emit(WeatherError(message: "Can't fetch data"));

    }
  }

}

