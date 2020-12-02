import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'package:http/http.dart' as http;

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
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: fetchAPI,
        backgroundColor: Colors.white,
        child: Icon(
          Icons.search,
          color: Colors.black,
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        //  color: Color(0xff1DB954),
        color: Colors.white70,
        child: Padding(
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
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
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
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CardShow(
                          label: 'ACTIVE',
                          data: activeCase,
                        ),
                        CardShow(
                          label: 'CONFIRMED',
                          data: confirmed,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CardShow(
                          label: 'RECOVERED',
                          data: recovered,
                        ),
                        CardShow(
                          label: 'DEATHS',
                          data: deaths,
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
  final dataList = [0.0, 3.0, 4.0, 6.9, 8.0, 10.0, 14.0];

  final int data;
  final String label;
  //final Color color;

  CardShow({
    Key key,
    this.data,
    this.label,
  });
  @override
  Widget build(BuildContext context) {
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
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 40,
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
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 10,
              ),
              child: Text(
                data == null ? '' : '$data',
                style: TextStyle(
                  fontSize: 23.0,
                  fontWeight: FontWeight.w900,
                  color: Colors.red,
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 3.0),
              height: 20.0,
              width: 100.0,
              child: Sparkline(
                data: dataList,
                lineColor: Colors.red,
                pointsMode: PointsMode.all,
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
