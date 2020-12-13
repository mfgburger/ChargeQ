import 'package:chargeq_app/assets/images/image.dart';
import 'package:chargeq_app/pages/main/customPainter.dart';
import 'package:chargeq_app/pages/main/tripsSection.dart';
import 'package:chargeq_app/res/theme.dart';
import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: CustomPaint(painter: BackgroundPainter())),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: ListView(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.05),
                    child: Text("ChargeQ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            height: 0.8,
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.w700)),
                  ),
                  Text("MyCharge",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          height: 0.9,
                          color: Colors.black87,
                          fontSize: 20,
                          fontWeight: FontWeight.w700)),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Text("Welcome back,\nCharlie!",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: Colors.black87)),
                  ),
                  Card(
                    margin: EdgeInsets.only(bottom: 10),
                    shadowColor: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Stack(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "My Car",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20),
                              ),
                              Container(height: 30),
                              Row(
                                children: [
                                  CardEntry("CHARGE", "15", "kWh"),
                                  CardEntry("DISTANCE", "120", "km")
                                ],
                              ),
                              Row(
                                children: [
                                  CardEntry("TIME UNTIL\nCHARGED", "13", "min"),
                                  Spacer(),
                                  ToggleSwitch(
                                    minWidth: 120.0,
                                    initialLabelIndex: 1,
                                    cornerRadius: 20.0,
                                    activeFgColor: Colors.white,
                                    inactiveBgColor: Colors.grey,
                                    inactiveFgColor: Colors.white,
                                    labels: ['EcoCharge', 'FastCharge'],
                                    icons: [Icons.close, Icons.code],
                                    activeBgColors: [myGreen, myGreen],
                                    onToggle: (index) {
                                      print('switched to: $index');
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Positioned.fill(
                              child: Align(
                            alignment: Alignment.topRight,
                            child: car(),
                          )),
                        ],
                      ),
                    ),
                  ),
                  TripsSection(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardEntry extends StatelessWidget {
  String title = "", content = "", unit = "";

  CardEntry(this.title, this.content, this.unit);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        children: [
          Text(title,
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Colors.black54)),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(content,
                  style: TextStyle(
                      color: myGreen,
                      fontSize: 20,
                      fontWeight: FontWeight.w700)),
              Text(unit, style: TextStyle(color: myGreen, fontSize: 10))
            ],
          )
        ],
      ),
    );
  }
}
