import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'package:google_fonts/google_fonts.dart';

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
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          elevation: 10.0,
          shadowColor: Color(0xfffde9df),
          child: Column(
            children: [
              SizedBox(height: 10.0),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.1 - 12.0,
                  vertical: 15.0,
                ),
                child: Text(
                  label,
                  style: GoogleFonts.harmattan(
                    textStyle: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.1 - 30,
                  vertical: 3,
                ),
                child: Text(
                  data == null ? '' : '$data',
                  style: GoogleFonts.harmattan(
                    textStyle: TextStyle(
                      fontSize: 27.0,
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.w600,
                      color: color,
                    ),
                  ),
                ),
              ),
              //  SizedBox(height: 10.0),
              /*
              Container(
                height: 30.0,
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
              */
              SizedBox(height: 20.0)
            ],
          ),
        ),
      ),
    );
  }
}
