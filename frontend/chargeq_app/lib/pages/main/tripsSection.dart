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
          Text("Upcoming trips", style: TextStyle(fontSize: 17, fontWeight: FontWeight.w800, color: Colors.black87)),
          Spacer(),
          MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              color: myGreen,
              onPressed: () {
                print("hello");
              },
              child: Text("+ add trip",
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
          Stack(
            children: [
              Container(
                  width: 50.0,
                  height: 50.0,
                  decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: myGreen, width: 5),
                  )),
              Positioned.fill(
                  child: Align(
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Text(
                              kWh,
                              style: TextStyle(
                                  height: 0.8,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 16),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Text("kWh",
                              style: TextStyle(fontSize: 12),
                              textAlign: TextAlign.center)
                        ],
                      ))),
            ],
          ),
          Spacer(flex: 2),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(fontWeight: FontWeight.w800)),
              Text(time)
            ],
          ),
          Spacer(flex: 2),
          Text(from, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
          Spacer(),
          Icon(Icons.arrow_forward_ios, color: myGreen, size: 20),
          Spacer(),
          Text(to, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600))
        ],
      ),
    );
  }
}
