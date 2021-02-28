import 'package:chargeq_app/pages/loading/loadingPage.dart';
import 'package:chargeq_app/pages/login/loginPage.dart';
import 'package:chargeq_app/res/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(title: 'ChargeQ MyCharge', theme: themeData, home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    new Future.delayed(const Duration(seconds: 2), () => Navigator.pushReplacement(context, _createRoute()));
  }

  // A fancy page route builder that animates the top part of the loading screen to the top of the login page.
  Route _createRoute() {
    return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => LoginPage(),
        transitionDuration: Duration(seconds: 2),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          animation = new CurvedAnimation(parent: animation, curve: Curves.easeIn);
          return FadeTransition(opacity: animation, child: child);
        });
  }

  @override
  Widget build(BuildContext context) {
    return LoadingPage();
  }
}
