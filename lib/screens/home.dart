import 'package:bloc/screens/details.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late String text = "";

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Search Here',
              ),
              onChanged: (text) {
                setState(() {
                  text = text;
                });
                print(text);
              },
            ),
            GestureDetector(
              onTap: () {
                if (text != "") {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (ctx) => const Details()));
                } else {
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
        ),
      ),
    );
  }
}
