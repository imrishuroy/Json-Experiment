// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class CoronaTracker extends StatefulWidget {
//   @override
//   _CoronaTrackerState createState() => _CoronaTrackerState();
// }

// class _CoronaTrackerState extends State<CoronaTracker> {
//   TextEditingController _controller = TextEditingController();
//   int activeCase;
//   int confirmed;
//   int recovered;
//   int deaths;

//   fetchAPI() async {
//     setState(() {});
//     // var url = 'https://api.covid19api.com/total/country/india';
//     var url = 'https://api.covidindiatracker.com/state_data.json';

//     var response = await http.get(url);
//     if (response.statusCode == 200) {
//       List jsonResponse = jsonDecode(response.body);

//       for (var value in jsonResponse) {
//         for (var data in value['districtData']) {
//           if (_controller.text == value['state']) {
//             //print('${_controller.text}  : ${data['confirmed']}');
//             setState(() {
//               activeCase = value['active'];
//               confirmed = value['confirmed'];
//               recovered = value['recovered'];
//               deaths = value['deaths'];
//             });
//           } else if (_controller.text == data['id']) {
//             setState(() {
//               activeCase = data['active'];
//               confirmed = data['confirmed'];
//               recovered = data['recovered'];
//               deaths = data['deaths'];
//             });
//           }
//         }
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: BottomAppBar(
//         //  color: Color(0xff1DB954),
//         color: Colors.white70,
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 5.0),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               IconButton(
//                   icon: Image.asset('assets/india.png'), onPressed: () {}),
//               IconButton(
//                   icon: Image.asset('assets/trend.png'), onPressed: () {}),
//               IconButton(
//                   icon: Image.asset('assets/world.png'), onPressed: () {}),
//               IconButton(
//                   icon: Image.asset('assets/healthcare.png'), onPressed: () {}),
//             ],
//           ),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: fetchAPI,
//         child: Icon(
//           Icons.get_app,
//         ),
//       ),
//       appBar: AppBar(
//         title: Text('Corona Tracker'),
//       ),
//       body: ListView(
//         children: [
//           Padding(
//             padding: const EdgeInsets.symmetric(
//               horizontal: 15.0,
//               vertical: 15.0,
//             ),
//             child: TextField(
//               controller: _controller,
//               decoration: InputDecoration(
//                 hintText: 'Search State of District',
//                 alignLabelWithHint: true,
//                 hoverColor: Colors.green,
//                 focusColor: Colors.green,
//                 fillColor: Colors.green,
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(height: 20),
//           // Text(_controller.text == null
//           //     ? ''
//           //     : _controller.text + ' ' + '$confirmed'),
//           DisplayCard(
//             label: 'Active Case',
//             data: activeCase,
//             color: Colors.blue,
//           ),
//           DisplayCard(
//             label: 'Confirmed Case',
//             data: confirmed,
//             color: Colors.purple,
//           ),
//           DisplayCard(
//             label: 'Recovered',
//             data: recovered,
//             color: Colors.green,
//           ),
//           DisplayCard(
//             label: 'Deaths',
//             data: deaths,
//             color: Colors.red,
//           ),
//         ],
//       ),
//     );
//   }
// }

// class DisplayCard extends StatelessWidget {
//   DisplayCard({this.data, this.label, this.color = Colors.black});

//   final int data;
//   final String label;
//   final Color color;

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
//               color: color,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
