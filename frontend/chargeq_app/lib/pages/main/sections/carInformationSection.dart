import 'package:chargeq_app/assets/images/image.dart';
import 'package:chargeq_app/res/theme.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:toggle_switch/toggle_switch.dart';

/// A card showing the current information about the car charging.
class CarInformationSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 20),
      shadowColor: Colors.black,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
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
                  style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w700, fontSize: 20),
                ),
                Container(height: 10),
                Row(
                  children: [CardEntry("CHARGE", "15", "kWh"), CardEntry("DISTANCE", "120", "km")],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CardEntry("TIME UNTIL\nCHARGED", "13", "min"),
                    Spacer(),
                    // A toggle that enables the user to switch between eco and fast charging.
                    ToggleSwitch(
                      minWidth: 100.0,
                      initialLabelIndex: 1,
                      cornerRadius: 20.0,
                      fontSize: 12,
                      iconSize: 12,
                      activeFgColor: Colors.white,
                      inactiveBgColor: Colors.black12,
                      inactiveFgColor: Colors.black45,
                      labels: ['EcoCharge', 'FastCharge'],
                      icons: [Icons.nature_people, Icons.hourglass_bottom_rounded],
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
              child: car(150),
            )),
          ],
        ),
      ),
    );
  }
}

/// A single entry in the car card, showing a single statistic about the current status.
// ignore: must_be_immutable
class CardEntry extends StatelessWidget {
  String title = "", content = "", unit = "";

  CardEntry(this.title, this.content, this.unit);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        children: [
          Text(title, style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Colors.black54)),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(content, style: TextStyle(color: myGreen, fontSize: 20, fontWeight: FontWeight.w700)),
              Text(unit, style: TextStyle(color: myGreen, fontSize: 10))
            ],
          )
        ],
      ),
    );
  }
}
