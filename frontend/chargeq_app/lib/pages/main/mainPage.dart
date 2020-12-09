import 'package:chargeq_app/pages/main/tripsSection.dart';
import 'package:chargeq_app/res/theme.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text("ChargeQ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: myGreen,
                      fontSize: 40,
                      fontWeight: FontWeight.w700)),
              Text("MyCharge",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w600)),
              Spacer(),
              Text("Welcome back,\nCharlie!",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
              Spacer(),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                color: myGreen,
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Column(
                    children: [
                      Text(
                        "My Car",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              Spacer(),
              TripsSection(),
              Spacer(flex: 8),
            ],
          ),
        ),
      ),
    );
  }
}
