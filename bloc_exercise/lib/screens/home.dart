import 'package:bloc_exercise/cubits/weather_cubit.dart';
import 'package:bloc_exercise/cubits/weather_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'details.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   String text = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(10),
        child: BlocConsumer<WeatherCubit, WeatherState>(
          listener: (ctx, state) {
            if (state is WeatherError) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text("Error occur")));
            }
          },
          builder: (BuildContext context, state) {
            if (state is WeatherInitial) {
              return buildInput();
            } else if (state is WeatherLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is WeatherLoaded) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    state.weather.temperatureCelsius.toStringAsFixed(2) + ' C',
                    style: const TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  buildInput(),
                ],
              );
            } else {
              // for error...
              return buildInput();
            }
          },
        ),
      ),
    );
  }

  Widget buildInput() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextField(
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Search Here',
          ),
          onChanged: (t) {
            setState(() {
              text = t;
            });

            print(text);
          },
        ),
        GestureDetector(
          onTap: () {
            if (text != "") {
             /* Navigator.push(context,
                  MaterialPageRoute(builder: (ctx) => const Details()));*/
              BlocProvider.of<WeatherCubit>(context).getWeather(text);
            } else {
              print(text);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Please type somthing.."),
                ),
              );
            }
            print("Click");
          },
          child: Container(
            margin: const EdgeInsets.only(top: 20),
            height: 60,
            width: 120,
            color: Colors.blue,
            child: const Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
