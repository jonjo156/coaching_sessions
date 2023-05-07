import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() async {
  var crypto = await getCryptoFromApi();
  runApp( MyApp(crypto: crypto));
}
// apiResponse is json which is hte lang and the form is Map<String, dynamc>
var apiResponse = {"name":"BTCUSDT","price":29868.82014851};

// 
class MyApp extends StatelessWidget {
  final Crypto crypto;
  const MyApp({super.key, required this.crypto});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jonjos App',
      home:  HomePage(crypto: crypto),
    );
  }
}


class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.crypto});
  final Crypto crypto;

  @override
  Widget build(BuildContext){
    
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Container(color: Colors.green, height: 102.2, width: 102.2),
        Text(crypto.name),
        Text('Price of the crypto: ${crypto.price}'),
        Text('Price of the crypto: 5'),
        Text('Price of the crypto: 20'),
        Text('Price of the crypto: ${crypto.price}'),
        Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Container(color: Colors.green, height: 102.2, width: 102.2),
        Text('ethereum'),
        Text('Price of the crypto: ${crypto.price}'),
        Text('Price of the crypto: 5'),
        Text('Price of the crypto: 20'),
        Text('Price of the crypto: ${crypto.price}'),
      ]),
      ]),
    );
  }
}

class Crypto {
  final String name;
  final String price;
  Crypto({ required this.name, required this.price});

 factory Crypto.fromJson(Map<String, dynamic> json) {
   return Crypto(
    name: json['symbol'],
    price: json['price']
   );
  }
}

Future<Crypto> getCryptoFromApi() async {
 var response = await http.get(Uri.parse('https://api.binance.com/api/v3/ticker/price?symbol=BTCUSDT'));
return Crypto.fromJson(jsonDecode(response.body));
}

Future<List<Trade>> getTradesFromApi() async {
  var response = await http.get(Uri.parse('https://api.binance.com/api/v3/trades?symbol=BTCUSDT'));
  List<dynamic> jsonList = jsonDecode(response.body);
  List<Trade> tradeList = [];
  for (var jsonObject in jsonList){
    tradeList.add(Trade.fromJson(jsonObject));
  }
  print(tradeList);
  return tradeList;
}


class Trade {
  final String price;
  final String quantity;
  const Trade({required this.price, required this.quantity});

  factory Trade.fromJson(Map<String, dynamic> json) {
    return Trade(
      price: json['price'],
      quantity: json['qty']
    );
  }
}

