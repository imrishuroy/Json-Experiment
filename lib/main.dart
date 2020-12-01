import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  var data;
  String country = 'India';

  var newConfirmed;
  var totalConfirmed;
  var newDeaths;
  var totalDeaths;
  var newRecovered;
  var totalRecovered;
  var date;

  fetchData() async {
    var url = 'https://api.covid19api.com/summary';

    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      setState(() {
        // data = jsonResponse['Global']['NewConfirmed'];
        //data = jsonResponse['Countries'][76];
        newConfirmed = jsonResponse['Countries'][76]['NewConfirmed'];
        totalConfirmed = jsonResponse['Countries'][76]['TotalConfirmed'];
        newDeaths = jsonResponse['Countries'][76]['NewDeaths'];
        totalDeaths = jsonResponse['Countries'][76]['TotalDeaths'];
        newRecovered = jsonResponse['Countries'][76]['NewRecovered'];
        totalRecovered = jsonResponse['Countries'][76]['TotalRecovered'];
        date = jsonResponse['Countries'][76]['Date'];
      });
      //  print(jsonResponse['Countries']);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Json Experiment'),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 10,
            ),
            child: Text(
              date == null ? '' : '$date',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ),
          DisplayCard(
            label: 'New Confirmed',
            data: newConfirmed,
          ),
          DisplayCard(
            label: 'Total Confirmed Cases',
            data: totalConfirmed,
          ),
          DisplayCard(
            label: 'New Deaths',
            data: newDeaths,
          ),
          DisplayCard(
            label: 'Total Deaths',
            data: totalDeaths,
          ),
          DisplayCard(
            label: 'New Recovered',
            data: newRecovered,
          ),
          DisplayCard(
            label: 'Total Recovered',
            data: totalRecovered,
          ),
        ],
      ),
    );
  }
}

class DisplayCard extends StatelessWidget {
  DisplayCard({this.data, this.label});

  final data;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Text(
            data == null ? '$label' : '$label : $data',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
