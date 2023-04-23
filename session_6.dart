import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jonjos App',
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext){
    return Scaffold(

      body: Column(children: [
        Container(color: Colors.green, height: 102.2, width: 102.2),
        Text('name'),
        Text('Number of gym sessions'),

      ]),
    );
  }
}
