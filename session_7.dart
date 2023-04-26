import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
// apiResponse is json which is hte lang and the form is Map<String, dynamc>
var apiResponse = {"name":"BTCUSDT","price":29868.82014851};

// 
class MyApp extends StatelessWidget {
  // this is a con
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jonjos App',
      home:  HomePage2(crypto: Crypto.fromJson(apiResponse)),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final String name = 'BTCUSDT';
  final double price = 20500.50;

  @override
  Widget build(BuildContext){
    return Scaffold(
      body: Column(children: [
        Container(color: Colors.green, height: 102.2, width: 102.2),
        Text(name),
        Text('Price of the crypto: $price'),
      ]),
    );
  }
}

class HomePage1 extends StatelessWidget {
  const HomePage1({super.key, required this.name, required this.price});

  final String name;
  final double price;

  @override
  Widget build(BuildContext){
    return Scaffold(
      body: Column(children: [
        Container(color: Colors.green, height: 102.2, width: 102.2),
        Text(name),
        Text('Price of the crypto: $price'),
      ]),
    );
  }
}

class HomePage2 extends StatelessWidget {
  const HomePage2({super.key, required this.crypto});

  final Crypto crypto;

  @override
  Widget build(BuildContext){
    return Scaffold(
      body: Column(children: [
        Container(color: Colors.green, height: 102.2, width: 102.2),
        Text(crypto.name),
        Text('Price of the crypto: ${crypto.price}'),
      ]),
    );
  }
}

class Crypto {
  final String name;
  final double price;
  Crypto({ required this.name, required this.price});

 factory Crypto.fromJson(Map<String, dynamic> json) {
   return Crypto(
    name: json['name'],
    price: json['price']
   );
  }

}
