import 'package:bloc_exercise/cubits/weather_cubit.dart';
import 'package:bloc_exercise/data/weather_repository.dart';
import 'package:bloc_exercise/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(

          primarySwatch: Colors.blue,
        ),
        home: BlocProvider(
          create: (context) => WeatherCubit(FakeWeatherRepository()),
          child: const HomePage(),
        )
    );
  }
}
