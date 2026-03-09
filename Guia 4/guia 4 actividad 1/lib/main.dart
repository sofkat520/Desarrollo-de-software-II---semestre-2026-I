import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Mostrar imágenes"),
        ), // AppBar
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: 250.0,
                width: 458.0,
                child: Image(
                  image: AssetImage('assets/images/rinini.jpeg'),
                ), // Image
              ), // SizedBox
              SizedBox(
                height: 250.0,
                width: 458.0,
                child: Image.network(
                    'https://pbs.twimg.com/media/HC5CzbWa8AA0_mF?format=jpg&name=large'), // Image.network
              ), // SizedBox
            ],
          ), //Column
        ), // Center
      ), // Scaffold
    ); // MaterialApp
  }
}
