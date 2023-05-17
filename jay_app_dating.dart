import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


void main() async {
  var dating = await getDateApi();
  runApp(MyApp(dating: dating));
}

//json - showing what to search for (don't have API yet)
//below is a named parameter 
var apiResponse = {"name": "XXX", "date":"XXX"};

//below Dating is the class and dating is the instance
class MyApp extends StatelessWidget {
  final Dating dating;
  const MyApp({super.key, required this.dating});
  //now using constructor method 

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jays App',
      home: HomePage(dating: dating),
    );
  }
}

class HomePage extends StatelessWidget {
  final Dating dating;
   HomePage({super.key, required this.dating});

  @override
  Widget build(BuildContext){
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            color: Color(0xFF0000),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('IMAGE'), //should be image so would have to define height
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(color:Color(0xFFCCCB), borderRadius: BorderRadius.circular(4),),
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: Text('Register'))
                    ),
                    const SizedBox(width: 8,),
                    Icon(Icons.menu)
                  ],
                )
              ],
            )
          )
        ],
      )
    );
}
}

class Dating {
  final String name;
  final String date;
  Dating({ required this.name, required this.date});

 factory Dating.fromJson(Map<String, dynamic> json) {
   return Dating(
    name: json['name'],
    date: json['date']
   );
  }
  }


Future<Dating> getDateApi() async {
 var response = await http.get(Uri.parse('https://api.binance.com/api/v3/ticker/price?symbol=BTCUSDT'));
return Dating.fromJson(jsonDecode(response.body));
}





// void main() async {
//   var dating = await getDateApi();
//   runApp(MyApp(dating: dating));
// }

// var apiResponse = {"name": "XXX", "date":"XXX"};

// class MyApp extends StatelessWidget {
//   final Dating dating;
//   const MyApp({Key? key, required this.dating}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Jays App',
//       home: HomePage(dating: dating),
//     );
//   }
// }

// class HomePage extends StatelessWidget {
//   final Dating dating;
//   const HomePage({Key? key, required this.dating}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Container(
//             color: Color(0xFFFF0000),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 Text('IMAGE'), //should be image so would have to define height
//                 Row(
//                   children: [
//                     Container(
//                       decoration: BoxDecoration(color:Color(0xFFFFCCCB), borderRadius: BorderRadius.circular(4),),
//                       child: Padding(
//                         padding: EdgeInsets.all(8),
//                         child: Text('Register')),
//                     ),
//                     const SizedBox(width: 8,),
//                     Icon(Icons.menu)
//                   ],
//                 )
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
// }

// // This is my data class
// class Dating {
//   final String name;
//   final String date;
//   Dating({ required this.name, required this.date});

//   factory Dating.fromJson(Map<String, dynamic> json) {
//     return Dating(
//       name: json['name'],
//       date: json['date']
//     );
//   }
// }

// Future<Dating> getDateApi() async {
//   var response = await http.get(Uri.parse('https://api.binance.com/api/v3/ticker/price?symbol=BTCUSDT'));
//   return Dating.fromJson(jsonDecode(response.body));
// }
