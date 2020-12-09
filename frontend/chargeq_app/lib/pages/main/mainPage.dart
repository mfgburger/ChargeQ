import 'package:chargeq_app/assets/images/image.dart';
import 'package:chargeq_app/pages/main/tripsSection.dart';
import 'package:chargeq_app/res/theme.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
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
                        color: myGreen,
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
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                color: myGreen,
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
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 20),
                          ),
                          Container(height: 30),
                          Row(
                            children: [Text("some data about the car")],
                          ),
                          Container(height: 50),
                        ],
                      ),
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.topRight,
                      child:car(80),)),
                    ],
                  ),
                ),
              ),
              TripsSection(),
            ],
          ),
        ),
      ),
    );
  }
}
