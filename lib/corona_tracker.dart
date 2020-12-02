import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CoronaTracker extends StatefulWidget {
  @override
  _CoronaTrackerState createState() => _CoronaTrackerState();
}

class _CoronaTrackerState extends State<CoronaTracker> {
  TextEditingController _controller = TextEditingController();
  String confirmed;

  fetchAPI() async {
    // List<String> states = ['Other'];
    // print(_controller.text);
    // var url = 'https://api.covid19api.com/total/country/india';
    var url = 'https://api.covidindiatracker.com/state_data.json';

    var response = await http.get(url);
    if (response.statusCode == 200) {
      List jsonResponse = jsonDecode(response.body);
      // setState(() {
      //   jsonData = jsonResponse;
      // });
      for (var value in jsonResponse) {
        // print(value['state']);
        // print(value['confirmed']);
        //  print('${value['state']}  : ${value['confirmed']}');
        // print('${value['state']}  : ${value['confirmed']}');
        //  states.add(value['state']);
        if (_controller.text == value['state']) {
          print('${_controller.text}  : ${value['confirmed']}');
          setState(() {
            confirmed = value['confirmed'].toString();
          });
        }

        // for (String s in value) {
        //   if (_controller.text == s) {
        //     print(value['confirmed']);
        //   }
        // }
        // print(value['state']);

        //  print(jsonResponse[value['state']]);

      }
      // print(jsonResponse[0]['state']);
      // for (String s in states) {
      //   if (_controller.text == s) {
      //     print(s);
      //   }
      // }
      //  print(states);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: fetchAPI,
        child: Icon(
          Icons.get_app,
        ),
      ),
      appBar: AppBar(
        title: Text('Corona Tracker'),
      ),
      body: ListView(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Text(_controller.text == null
              ? ''
              : _controller.text + ' ' + '$confirmed')
        ],
      ),
    );
  }
}
