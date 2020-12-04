import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Care extends StatelessWidget {
  static String routeName = 'care-page';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffffdfb),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 23.0, vertical: 10.0),
                child: Text(
                  'COVID-19',
                  textAlign: TextAlign.start,
                  style: GoogleFonts.harmattan(
                    textStyle: TextStyle(
                      fontSize: 30.0,
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 23.0),
                child: Text(
                  'Coronavirus disease (COVID-19) is an infectious disease caused by a newly discovered coronavirus.\n\nMost people infected with the COVID-19 virus will experience mild to moderate respiratory illness and recover without requiring special treatment.\n\nProtect yourself and others from infection by  washing your hands or using an alcohol based rub frequently and not touching your face.',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                ),
                child: Text(
                  'SYMPTOMS',
                  textAlign: TextAlign.start,
                  style: GoogleFonts.harmattan(
                    textStyle: TextStyle(
                      fontSize: 25.0,
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              Symptoms(
                imageUrl: 'fever.jpg',
                title: 'Fever',
                subTitle: 'Covid-19 may lead you to high fever.',
              ),
              Symptoms(
                imageUrl: 'dry-cough.jpg',
                title: 'Dry Cough',
                subTitle: 'You may face difficulties in breathing.',
              ),
              Symptoms(
                imageUrl: 'tiredness.jpg',
                title: 'Tiredness',
                subTitle: 'You may feel tired all the time.',
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                ),
                child: Text(
                  'SAFETY MEASURES',
                  textAlign: TextAlign.start,
                  style: GoogleFonts.harmattan(
                    textStyle: TextStyle(
                      fontSize: 25.0,
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 23.0, vertical: 5.0),
                child: Row(
                  children: [
                    Icon(Icons.do_not_touch),
                    SizedBox(width: 10.0),
                    Expanded(
                      child: Text(
                        'Clean your hands often. Use soap and water, or an alcohol-based hand rub.',
                        overflow: TextOverflow.visible,
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 23.0, vertical: 5.0),
                child: Row(
                  children: [
                    Icon(Icons.do_not_touch),
                    SizedBox(width: 10.0),
                    Expanded(
                      child: Text(
                        'Clean your hands often. Use soap and water, or an alcohol-based hand rub.',
                        overflow: TextOverflow.visible,
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Symptoms extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subTitle;

  const Symptoms({Key key, this.imageUrl, this.title, this.subTitle})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        color: Color(0xfffceef5),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          child: ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.asset(
                'assets/$imageUrl',
                fit: BoxFit.cover,
                width: 70.0,
                height: 300.0,
              ),
            ),
            title: Text(title),
            subtitle: Text(subTitle),
          ),
        ),
      ),
    );
  }
}
