import 'package:flutter/material.dart';
import 'package:json_experiment/care.dart';
//import 'package:charts_flutter/flutter.dart' as charts;
// import 'package:http/http.dart' as http;
// import 'dart:convert';

//import 'package:json_experiment/corona_tracker.dart';
import 'package:json_experiment/homepage.dart';
import 'package:json_experiment/splashscreen.dart';

//import 'package:json_experiment/line_cart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // List<charts.Series> seriesList;
  // bool animate = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.green,
      ),
      debugShowCheckedModeBanner: false,
      //home: CoronaTracker(),
      //  home: HomePage(),
      home: MySplashScreen(),
      routes: {
        Care.routeName: (ctx) => Care(),
      },
      // home: LineChat(seriesList, animate),
    );
  }
}

// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   TextEditingController _controller = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     fetchData();
//   }

//   var data;
//   String country = 'India';

//   var newConfirmed;
//   var totalConfirmed;
//   var newDeaths;
//   var totalDeaths;
//   var newRecovered;
//   var totalRecovered;
//   var date;
//   List jsonData;

//   fetchAPI() async {
//     // List<String> states = ['Other'];
//     // print(_controller.text);
//     // var url = 'https://api.covid19api.com/total/country/india';
//     var url = 'https://api.covidindiatracker.com/state_data.json';

//     var response = await http.get(url);
//     if (response.statusCode == 200) {
//       List jsonResponse = jsonDecode(response.body);
//       // setState(() {
//       //   jsonData = jsonResponse;
//       // });
//       for (var value in jsonResponse) {
//         // print(value['state']);
//         // print(value['confirmed']);
//         //  print('${value['state']}  : ${value['confirmed']}');
//         // print('${value['state']}  : ${value['confirmed']}');
//         //  states.add(value['state']);
//         if (_controller.text == value['state']) {
//           print('${_controller.text}  : ${value['confirmed']}');
//         }

//         // for (String s in value) {
//         //   if (_controller.text == s) {
//         //     print(value['confirmed']);
//         //   }
//         // }
//         // print(value['state']);

//         //  print(jsonResponse[value['state']]);

//       }
//       // print(jsonResponse[0]['state']);
//       // for (String s in states) {
//       //   if (_controller.text == s) {
//       //     print(s);
//       //   }
//       // }
//       //  print(states);
//     }
//   }

//   fetchData() async {
//     var url = 'https://api.covid19api.com/summary';

//     var response = await http.get(url);
//     if (response.statusCode == 200) {
//       var jsonResponse = jsonDecode(response.body);
//       setState(() {
//         // data = jsonResponse['Global']['NewConfirmed'];
//         //data = jsonResponse['Countries'][76];
//         newConfirmed = jsonResponse['Countries'][76]['NewConfirmed'];
//         totalConfirmed = jsonResponse['Countries'][76]['TotalConfirmed'];
//         newDeaths = jsonResponse['Countries'][76]['NewDeaths'];
//         totalDeaths = jsonResponse['Countries'][76]['TotalDeaths'];
//         newRecovered = jsonResponse['Countries'][76]['NewRecovered'];
//         totalRecovered = jsonResponse['Countries'][76]['TotalRecovered'];
//         date = jsonResponse['Countries'][76]['Date'];
//       });
//       //  print(jsonResponse['Countries']);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: FloatingActionButton(
//         onPressed: fetchAPI,
//         child: Icon(
//           Icons.get_app,
//         ),
//       ),
//       appBar: AppBar(
//         title: Text('Json Experiment'),
//       ),
//       body: ListView(
//         children: [
//           Padding(
//             padding:
//                 const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
//             child: TextField(
//               controller: _controller,
//               decoration: InputDecoration(
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(
//               horizontal: 10,
//               vertical: 10,
//             ),
//             child: Text(
//               date == null ? '' : '$date',
//               style: TextStyle(fontSize: 16),
//               textAlign: TextAlign.center,
//             ),
//           ),
//           DisplayCard(
//             label: 'New Confirmed',
//             data: newConfirmed,
//           ),
//           DisplayCard(
//             label: 'Total Confirmed Cases',
//             data: totalConfirmed,
//           ),
//           DisplayCard(
//             label: 'New Deaths',
//             data: newDeaths,
//           ),
//           DisplayCard(
//             label: 'Total Deaths',
//             data: totalDeaths,
//           ),
//           DisplayCard(
//             label: 'New Recovered',
//             data: newRecovered,
//           ),
//           DisplayCard(
//             label: 'Total Recovered',
//             data: totalRecovered,
//           ),
//         ],
//       ),
//     );
//   }
// }

// class DisplayCard extends StatelessWidget {
//   DisplayCard({this.data, this.label});

//   final data;
//   final String label;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//       child: Card(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
//           child: Text(
//             data == null ? '$label' : '$label : $data',
//             style: TextStyle(
//               fontSize: 20,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
