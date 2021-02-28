import 'package:chargeq_app/res/theme.dart';
import 'package:flutter/material.dart';

/// The loading screen, showing the logo in the center.
class LoadingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myGreen,
      body: Center(
        child: LogoHero(),
      ),
    );
  }
}

// The logo animation that animates the logo from the center of the loading screen to the top of the login screen.
class LogoHero extends StatelessWidget {
  Widget _flightShuttleBuilder(
    BuildContext flightContext,
    Animation<double> animation,
    HeroFlightDirection flightDirection,
    BuildContext fromHeroContext,
    BuildContext toHeroContext,
  ) {
    return DefaultTextStyle(
      style: DefaultTextStyle.of(toHeroContext).style,
      child: toHeroContext.widget,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Hero(
        tag: "logoHero",
        flightShuttleBuilder: _flightShuttleBuilder,
        child: Container(
          height: 100,
          child: Column(
            children: [
              Spacer(),
              Text("ChargeQ",
                  style: TextStyle(height: 0.8, color: Colors.white, fontWeight: FontWeight.w800, fontSize: 40)),
              Text("MyCharge",
                  style: TextStyle(height: 0.9, fontWeight: FontWeight.w700, fontSize: 25, color: Colors.black87)),
              Spacer()
            ],
          ),
        ));
  }
}
