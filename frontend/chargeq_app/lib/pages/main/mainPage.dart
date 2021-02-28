import 'package:chargeq_app/pages/main/sections/carInformationSection.dart';
import 'package:chargeq_app/res/theme.dart';
import 'package:flutter/material.dart';

import 'file:///D:/UniMatter/Master/Semester2/QElab/ChargeQ/frontend/chargeq_app/lib/pages/main/sections/tripsSection.dart';
import 'file:///D:/UniMatter/Master/Semester2/QElab/ChargeQ/frontend/chargeq_app/lib/pages/main/widgets/customPainter.dart';

/// The main page of the App.
/// It shows a header, the car information card, and a list of upcoming trips.
class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myGreen,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              // This shows the background swirl design with a green top section and a white bottom section, divided
              // by a curved painter.
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height + MediaQuery.of(context).padding.top,
                  color: Colors.white,
                  child: CustomPaint(painter: BackgroundPainter())),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  children: [
                    // The header section with the ChargeQ logo and welcome message.
                    Padding(
                      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05),
                      child: Text("ChargeQ",
                          textAlign: TextAlign.center,
                          style:
                              TextStyle(height: 0.8, color: Colors.white, fontSize: 40, fontWeight: FontWeight.w700)),
                    ),
                    Text("MyCharge",
                        textAlign: TextAlign.center,
                        style:
                            TextStyle(height: 0.9, color: Colors.black87, fontSize: 20, fontWeight: FontWeight.w700)),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 25),
                      child: Text("Welcome back,Charlie!",
                          style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700, color: Colors.white)),
                    ),
                    // The card showing the information about the current car charging status.
                    CarInformationSection(),
                    // The list of (mocked) trip data.
                    TripsSection(),
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
