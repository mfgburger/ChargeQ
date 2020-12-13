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
      backgroundColor: myGreen,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height +
                      MediaQuery.of(context).padding.top,
                  color: Colors.white,
                  child: CustomPaint(painter: BackgroundPainter())),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
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
                      padding: const EdgeInsets.symmetric(vertical: 25),
                      child: Text("Welcome back,Charlie!",
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                              color: Colors.white)),
                    ),
                    Card(
                      margin: EdgeInsets.only(bottom: 20),
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
                                Container(height: 10),
                                Row(
                                  children: [
                                    CardEntry("CHARGE", "15", "kWh"),
                                    CardEntry("DISTANCE", "120", "km")
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    CardEntry(
                                        "TIME UNTIL\nCHARGED", "13", "min"),
                                    Spacer(),
                                    ToggleSwitch(
                                      minWidth: 120.0,
                                      initialLabelIndex: 1,
                                      cornerRadius: 20.0,
                                      activeFgColor: Colors.white,
                                      inactiveBgColor: Colors.black12,
                                      inactiveFgColor: Colors.black45,
                                      labels: ['EcoCharge', 'FastCharge'],
                                      icons: [
                                        Icons.nature_people,
                                        Icons.hourglass_bottom_rounded
                                      ],
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
