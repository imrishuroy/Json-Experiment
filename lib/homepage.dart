import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'package:http/http.dart' as http;

final activeList = [0.0, 10000.0, 300.0, 500.0, 4000.0, 15000.0, 20800.0];
final confirmedList = [0.0, 387.0, 5574.0, 3061.0, 5435.0, 8122.0, 14809.0];
final recoveredList = [
  0.0,
  4300.0,
  2501.0,
  4599.7,
  100.0,
  5000.0,
  8000.0,
  19726.0
];
final deathList = [
  0.0,
  10000.0,
  4900.0,
  7900.0,
  500.0,
  100.0,
  4600.0,
  5000.0,
  15000.0,
  20800.0
];

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var data = [0.0, 0.5, 1.0, 3.0, 5.0, 10.0];
  TextEditingController _controller = TextEditingController();

  int activeCase;
  int confirmed;
  int recovered;
  int deaths;
  @override
  void initState() {
    super.initState();
    _controller.text = 'India';
    fetchIndiaAPI();
    // fetchAPI();
  }

  fetchIndiaAPI() async {
    setState(() {});
    // var url = 'https://api.covid19api.com/total/country/india';
    var url = 'https://api.covid19api.com/total/country/india';

    var response = await http.get(url);
    if (response.statusCode == 200) {
      List jsonResponse = jsonDecode(response.body);

      print('last${jsonResponse.last['Active']}');

      setState(() {
        activeCase = jsonResponse.last['Active'];
        confirmed = jsonResponse.last['Confirmed'];
        recovered = jsonResponse.last['Recovered'];
        deaths = jsonResponse.last['Deaths'];
      });
    }
  }

  fetchAPI() async {
    setState(() {});
    // var url = 'https://api.covid19api.com/total/country/india';
    var url = 'https://api.covidindiatracker.com/state_data.json';

    var response = await http.get(url);
    if (response.statusCode == 200) {
      List jsonResponse = jsonDecode(response.body);

      for (var value in jsonResponse) {
        for (var data in value['districtData']) {
          if (_controller.text == value['state']) {
            //print('${_controller.text}  : ${data['confirmed']}');
            setState(() {
              activeCase = value['active'];
              confirmed = value['confirmed'];
              recovered = value['recovered'];
              deaths = value['deaths'];
            });
          } else if (_controller.text == data['id']) {
            setState(() {
              activeCase = data['active'];
              confirmed = data['confirmed'];
              recovered = data['recovered'];
              deaths = data['deaths'];
            });
          }
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // final width = MediaQuery.of(context).size.width;
    //final height = MediaQuery.of(context).size.height;
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   onPressed: fetchAPI,
      //   backgroundColor: Colors.white,
      //   child: Icon(
      //     Icons.search,
      //     color: Colors.black,
      //   ),
      // ),
      bottomNavigationBar: BottomAppBar(
        //   notchMargin: 0.0,
        elevation: 10.0,
        //  color: Color(0xff1DB954),
        color: Colors.white,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(18.0),
              topRight: Radius.circular(18.0),
            ),
            border: Border.all(
              color: Colors.black12,
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  icon: Image.asset('assets/india.png'), onPressed: () {}),
              IconButton(
                  icon: Image.asset('assets/trend.png'), onPressed: () {}),
              IconButton(
                  icon: Image.asset('assets/world.png'), onPressed: () {}),
              IconButton(
                  icon: Image.asset('assets/healthcare.png'), onPressed: () {}),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 250.0,
              width: double.infinity,
              child: Image.asset(
                'assets/original.jpg',
                fit: BoxFit.cover,
              ),
            ),
            Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30.0,
                        vertical: 20.0,
                      ),
                      child: Text(
                        'India',
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/flag.png'),
                        ),
                      ),
                      height: 80,
                      width: 40,
                    ),
                  ],
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 21.0),
                            child: TextField(
                              controller: _controller,
                              decoration: InputDecoration(
                                hintText: 'Search State of District',
                                alignLabelWithHint: true,
                                hoverColor: Colors.green,
                                focusColor: Colors.green,
                                fillColor: Colors.green,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                          ),
                        ),
                        IconButton(
                          padding: EdgeInsets.only(right: 25.0),
                          iconSize: 42.0,
                          icon: Icon(
                            Icons.search,
                            color: Color(0xff1DB954),
                          ),
                          onPressed: fetchAPI,
                        )
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CardShow(
                          label: 'ACTIVE',
                          data: activeCase,
                          dataList: activeList,
                          color: Colors.blue,
                        ),
                        CardShow(
                          label: 'CONFIRMED',
                          data: confirmed,
                          dataList: confirmedList,
                          color: Colors.red,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CardShow(
                          label: 'RECOVERED',
                          data: recovered,
                          dataList: recoveredList,
                          color: Colors.green,
                        ),
                        CardShow(
                          label: 'DEATHS',
                          data: deaths,
                          dataList: deathList,
                          color: Colors.purple,
                        ),
                      ],
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class CardShow extends StatelessWidget {
  final int data;
  final String label;
  final Color color;
  final List<double> dataList;

  CardShow({
    Key key,
    this.data,
    this.label,
    this.dataList,
    this.color,
  });
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    // final height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 10.0,
        shadowColor: Colors.black87,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: width * 0.1 - 15,
                vertical: 15,
              ),
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: width * 0.1 - 20,
                vertical: 3,
              ),
              child: Text(
                data == null ? '' : '$data',
                style: TextStyle(
                    fontSize: 23.0, fontWeight: FontWeight.w900, color: color),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              height: 20.0,
              width: 100.0,
              child: Sparkline(
                data: dataList,
                lineColor: color,
                pointsMode: PointsMode.all,
                pointColor: Colors.black,
                // fillMode: FillMode.below,
                // fillGradient: LinearGradient(
                //   begin: Alignment.topCenter,
                //   end: Alignment.bottomCenter,
                //   colors: [
                //     Colors.red[800],
                //     Colors.red[200],
                //   ],
                // ),
              ),
            ),
            SizedBox(height: 30.0)
          ],
        ),
      ),
    );
  }
}
