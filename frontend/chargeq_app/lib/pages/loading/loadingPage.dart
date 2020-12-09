import 'dart:async';

import 'package:chargeq_app/pages/login/loginPage.dart';
import 'package:chargeq_app/res/theme.dart';
import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myGreen,
      body: Center(
        child: Column(
          children: [
            Spacer(),
            Text("ChargeQ",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 40)),
            Text("MyCharge",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 25,
                    color: Colors.black87)),
            Spacer()
          ],
        ),
      ),
    );
  }
}
