import 'dart:convert';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<dynamic> _movies = [];

  @override
  void initState() {
    super.initState();
    // JSON string representing the movie titles
    String jsonMovies = '''
      {
        "movies": [
          "Movie 1",
          "Movie 2",
          "Movie 3",
          "Movie 4",
          "Movie 5",
          "Movie 6",
          "Movie 7",
          "Movie 8",
          "Movie 9",
          "Movie 10",
          "Movie 11",
          "Movie 12",
          "Movie 13",
          "Movie 14",
          "Movie 15",
          "Movie 16",
          "Movie 17",
          "Movie 18",
          "Movie 19",
          "Movie 20"
        ]
      }
    ''';

    // Parse the JSON string
    Map<String, dynamic> movieData = json.decode(jsonMovies);

    // Extract the movie titles
    _movies = List<dynamic>.from(movieData['movies']);
  }

  List<dynamic> _generateRandomMovies() {
    var random = new Random();
    return List.generate(3, (index) => _movies[random.nextInt(_movies.length)]);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Jay's movie app"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 350,
                height: 350,
                color: Colors.red,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Jay's Movie selection",
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 16),
                    Column(
                      children: _generateRandomMovies().map((movie) {
                        return Text(
                          movie,
                          style: TextStyle(fontSize: 18),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _movies.shuffle();
                  });
                },
                child: Text(
                  'Generate New Movies',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class Quotes {
  final String author;
  final String quote;
  Quotes({ required this.author, required this.quote});

 factory Quotes.fromJson(Map<String, dynamic> json) {
   return Quotes(
    author: json["author"],
    quote: json["quote"]
    );
  }
}

Future<Quotes> getQuotesFromApi() async {
  var response = await http.get(Uri.parse('https://api.themotivate365.com/stoic-quote'));
  return Quotes.fromJson(jsonDecode(response.body));
}
