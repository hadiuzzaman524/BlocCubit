import 'package:bloc/bloc.dart';

import 'state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherState().init());
}
