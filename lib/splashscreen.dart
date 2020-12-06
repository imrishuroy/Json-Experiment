import 'package:flutter/material.dart';
import 'package:json_experiment/homepage.dart';

import 'package:splashscreen/splashscreen.dart';

class MySplashScreen extends StatefulWidget {
  @override
  _MySplashScreenState createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  @override
  void initState() {
    super.initState();
    getColor();
  }

  getColor() {
    var color = [
      Colors.orange,
      Colors.black,
      Colors.yellow,
      Colors.orange,
    ];
    // for (var i = 0; i < color.length; i++) {
    //   setState(() {
    //     print('Something haapes');
    //   });
    //   return color[i];
    // }

    for (var item in color) {
      setState(() {
        return item;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 3,
      navigateAfterSeconds: HomePage(),
      title: Text(
        'Covid-19 Tracker',
        style: TextStyle(
          fontSize: 30.0,
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
      onClick: getColor,
      image: Image.asset('assets/12.gif'),
      //backgroundColor: Color(0xff1DB954),
      backgroundColor: Color(0xff28df99),
      photoSize: 110.0,

      // loaderColor: Color(
      //   0xffff4b5c,
      // ),

      loaderColor: Colors.orangeAccent,
    );
  }
}
