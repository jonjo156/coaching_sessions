import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/crypto_row.dart';
import 'package:google_fonts/google_fonts.dart';
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
        children: [
          Container(
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset('assets/images/binance.png', height: 50),
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(color: Color(0xffFCD503), borderRadius: BorderRadius.circular(4),),
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: Text('Register'))
                    ),
                    const SizedBox(width: 8,),
                    Icon(Icons.menu)
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20,),
          Text('Get Crypto from Fiat', style: GoogleFonts.openSans(fontSize: 24, color: Color(0xff1E2329), fontWeight: FontWeight.w600),),
          const SizedBox(height: 4),
          Text('Easily buy 99+ cryptocurrencies with 50+ fiat currencies', style: GoogleFonts.openSans(fontSize: 12, color: Color(0xff474D57), fontWeight: FontWeight.w400),),
const SizedBox(height: 20,),
Padding(
  padding: const EdgeInsets.all(20.0),
  child:   Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16),
      color: Colors.white,
    ),
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
         Text('Cryptocurrency calculator', style: GoogleFonts.openSans(fontSize: 20, color: Color(0xff1E2329), fontWeight: FontWeight.w600),),
                   const SizedBox(height: 20,),
        Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), border: Border.all(color: Colors.grey),),
        child: Column(children: [
          CryptoRow(leftText: '1', rightText: 'USD',),
                  Divider(color: Colors.black,),
        CryptoRow(leftText: crypto.price, rightText: 'BTC',)

        ],),
        ),
  
        ],
      ),
    ),
  ),
)
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
