import 'package:chargeq_app/assets/images/image.dart';
import 'package:chargeq_app/models/popupData.dart';
import 'package:chargeq_app/res/theme.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:intl/intl.dart';

import 'customDropdownButton.dart';

/// The Popup dialog that enables the user to enter the new trip data.
class TripDialog extends StatefulWidget {
  // Indicates whether this charging job is a priority job or not.
  final bool isPriority;

  @override
  State<StatefulWidget> createState() => _TripDialogState();

  TripDialog(this.isPriority);
}

class _TripDialogState extends State<TripDialog> {
  late final PopupData popupData;
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  var dateFormat = DateFormat('yyyy-MM-dd');

  @override
  void initState() {
    super.initState();
    // This data structure is filled so we can send it to the backend. On opening the dialog, it is filled with
    // initial data.
    popupData = PopupData(
        isPriority: widget.isPriority,
        travelDateTime: DateTime.now(),
        travelReason: travelReasons[0],
        repeat: repeatCycles[0]);
  }

  /// A function that opens a date picker and sets the class's variable to the selected date.
  Future<Null> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 356)));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  /// A function that opens the time picker and sets the class's time to the selected time.
  Future<Null> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (picked != null && picked != selectedTime)
      setState(() {
        selectedTime = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.only(top: 10, left: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      title: Text(
        "Add Trip",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
        textAlign: TextAlign.center,
      ),
      content: Stack(
        children: [
          Align(alignment: Alignment.bottomRight, child: addTripCorner(MediaQuery.of(context).size.width * 0.5)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // The first section, showing the travel reason.
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 5),
                child: Text("I'm travelling because...", style: TextStyle(fontWeight: FontWeight.w600)),
              ),
              CustomDropdownButton(
                value: popupData.travelReason,
                onChanged: (value) {
                  setState(() {
                    popupData.travelReason = value;
                  });
                },
                items: travelReasons,
              ),

              // The second section, showing the date and time of the trip.
              Row(
                children: [
                  Text("on"),
                  Container(
                    height: 30,
                    margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                    child: RaisedButton(
                      color: selectedDate == null ? Color.fromRGBO(230, 230, 230, 1) : Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      onPressed: () {
                        _selectDate(context);
                      },
                      child: Text(selectedDate != null ? dateFormat.format(selectedDate) : 'Select date'),
                    ),
                  ),
                  Text("at"),
                  Container(
                    height: 30,
                    margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                    child: RaisedButton(
                      color: selectedTime == null ? Color.fromRGBO(230, 230, 230, 1) : Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      onPressed: () {
                        _selectTime(context);
                      },
                      child: Text(selectedTime?.format(context) ?? 'Select time'),
                    ),
                  ),
                ],
              ),

              // The third section, showing the start and end location. This should eventually open a location picker with
              // Maps, but for now, the location selection process is mocked for mockup reasons.
              Row(children: [
                Text("from "),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                  child: ElevatedButton(
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all(popupData.fromAddress != null ? 0 : 5),
                        backgroundColor: MaterialStateProperty.all(
                          popupData.fromAddress != null ? Colors.white : Color.fromRGBO(230, 230, 230, 1),
                        ),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        ),
                      ),
                      onPressed: () {
                        Future.delayed(
                            Duration(seconds: 1),
                            () => setState(() {
                                  popupData.fromAddress = "Chiemgaustr. 123\n83472 München";
                                }));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Text(popupData.fromAddress ?? 'Pick', style: TextStyle(color: Colors.black87)),
                      )),
                ),
              ]),
              Row(children: [
                Text("to "),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                  child: ElevatedButton(
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all(popupData.toAddress != null ? 0 : 5),
                        backgroundColor: MaterialStateProperty.all(
                          popupData.toAddress != null ? Colors.white : Color.fromRGBO(230, 230, 230, 1),
                        ),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        ),
                      ),
                      onPressed: () {
                        Future.delayed(
                            Duration(seconds: 1),
                            () => setState(() {
                                  popupData.toAddress = "Kaulbachstr. 123\n83472 München";
                                }));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Text(
                          popupData.toAddress ?? 'Pick',
                          style: TextStyle(color: Colors.black87),
                          maxLines: 2,
                        ),
                      )),
                ),
              ]),

              // The fourth section, showing the repeating pattern for this trip.
              Row(
                children: [
                  Text("repeat "),
                  CustomDropdownButton(
                    value: popupData.repeat,
                    onChanged: (value) {
                      setState(() {
                        popupData.repeat = value;
                      });
                    },
                    items: repeatCycles,
                  ),
                ],
              ),
              Spacer(),

              // The row with Cancel and Save buttons on the bottom.
              Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Row(
                  children: [
                    FlatButton(
                      child: Text("Cancel", style: TextStyle(color: Colors.black87)),
                      onPressed: () => Navigator.pop(context),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: RaisedButton(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                          color: myGreen,
                          child: Text("Save", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
                          onPressed: () {
                            // When Save is pressed, send to backend.
                            popupData.prepareAndSendBackend();
                            Navigator.pop(context);
                          }),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
