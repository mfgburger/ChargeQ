import 'package:chargeq_app/res/theme.dart';
import 'package:flutter/material.dart';

class TripsSection extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TripsSectionState();
}

class _TripsSectionState extends State<TripsSection> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        children: [
          Text("Upcoming trips", style: TextStyle(fontWeight: FontWeight.w600)),
          Spacer(),
          MaterialButton(
              color: myGreen,
              onPressed: () {
                print("hello");
              },
              child: Text("add trip",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w600)))
        ],
      ),
      SingleDay(),
      SingleDay(),
    ]);
  }
}

class SingleDay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Today - 23.12.2020",
              style: TextStyle(color: myGreen, fontWeight: FontWeight.w800)),
          SingleTrip(
              kWh: "15",
              title: "Doctor's visit",
              time: "16:00-16:45",
              from: "Klenzestr. 13\n83945 Mühldorf",
              to: "Chiemgaustr. 29b\n81549 München"),
          SingleTrip(
              kWh: "3.5",
              title: "Home",
              time: "18:00-18:30",
              from: "Chiemgaustr. 29b\n81549 München",
              to: "Kaulbachstr. 12\n84754 München")
        ],
      ),
    );
  }
}

class SingleTrip extends StatelessWidget {
  final String kWh, title, time, from, to;

  SingleTrip(
      {this.kWh = "",
      this.title = "",
      this.time = "",
      this.from = "",
      this.to = ""});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Text(kWh + "\nkWh", textAlign: TextAlign.center),
          Spacer(flex: 2),
          Column(
            children: [
              Text(title, style: TextStyle(fontWeight: FontWeight.w800)),
              Text(time)
            ],
          ),
          Spacer(flex: 2),
          Text(from, style: TextStyle(fontSize: 12)),
          Spacer(),
          Icon(Icons.arrow_forward_ios, color: myGreen, size: 20),
          Spacer(),
          Text(to, style: TextStyle(fontSize: 12))
        ],
      ),
    );
  }
}
