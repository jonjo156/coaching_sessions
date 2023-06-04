import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';

void main() async {
  var jobtitle = await getJobTitleFromApi();
  runApp(MyApp(
    jobtitle: jobtitle,
  ));
}

var apiResponse = {"job_title": "Software Engineer", "company_name": "Leidos"};

class MyApp extends StatelessWidget {
  final JobTitle jobtitle;
  const MyApp({
    super.key,
    required this.jobtitle,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Katies App',
      home: HomePage(jobtitle: jobtitle),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
    required this.jobtitle,
  });
  final JobTitle jobtitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 200,
                height: 200,
                child: TextField(
                    decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter a job title',
                )),
              ),
              Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/images/${jobtitle.companyname}.png',
                      ),
                      fit: BoxFit.contain,
                    ),
                  )),
              Text(jobtitle.name),
              Text('Company: ${jobtitle.companyname}'),
            ]),
      ),
    );
  }
}

class JobTitle {
  final String name;
  final String companyname;

  JobTitle({required this.name, required this.companyname});

  factory JobTitle.fromJson(Map<String, dynamic> json) {
    return JobTitle(name: json['job_title'], companyname: json['company_name']);
  }
}

Future<JobTitle> getJobTitleFromApi() async {
  var response = await http
      .get(Uri.parse('https://indeed-jobs-api.p.rapidapi.com/indeed-us/'));
  if (response.statusCode == 200) {
    return JobTitle.fromJson(jsonDecode(response.body));
  } else {
    return JobTitle.fromJson(
        {"job_title": "Software Engineer", "company_name": "Leidos"});
  }
}

//next steps
// Need to change the api, to return a List of job titles
// Next we need to add a method, that is called, and only displays jobs, containing the search text

