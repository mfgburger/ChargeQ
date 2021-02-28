import 'package:chargeq_app/assets/images/image.dart';
import 'package:chargeq_app/pages/main/customDropdownButton.dart';
import 'package:chargeq_app/pages/main/popupData.dart';
import 'package:chargeq_app/res/theme.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:intl/intl.dart';

class TripDialog extends StatefulWidget {
  final bool isPriority;

  @override
  State<StatefulWidget> createState() => _TripDialogState();

  TripDialog(this.isPriority);
}

class _TripDialogState extends State<TripDialog> {
  late final PopupData popupData;
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  String? fromAddress, toAddress;

  var dateFormat = DateFormat('yyyy-MM-dd');

  @override
  void initState() {
    super.initState();
    popupData = PopupData(
        isPriority: widget.isPriority,
        travelDateTime: DateTime.now(),
        travelReason: travelReasons[0],
        repeat: repeatCycles[0]);
  }

  Future<Null> _selectLocation(BuildContext context) async {
    Future.delayed(
        Duration(seconds: 1),
        () => setState(() {
              toAddress = "Chiemgaustr. 123\n83472 München";
              fromAddress = "Chiemgaustr. 123\n83472 München";
            }));
  }

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
              Row(children: [
                Text("from "),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                  child: ElevatedButton(
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all(fromAddress != null ? 0 : 5),
                        backgroundColor: MaterialStateProperty.all(
                          fromAddress != null ? Colors.white : Color.fromRGBO(230, 230, 230, 1),
                        ),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        ),
                      ),
                      onPressed: () {
                        Future.delayed(
                            Duration(seconds: 1),
                            () => setState(() {
                                  fromAddress = "Chiemgaustr. 123\n83472 München";
                                }));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Text(fromAddress ?? 'Pick', style: TextStyle(color: Colors.black87)),
                      )),
                ),
              ]),
              Row(children: [
                Text("to "),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                  child: ElevatedButton(
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all(fromAddress != null ? 0 : 5),
                        backgroundColor: MaterialStateProperty.all(
                          toAddress != null ? Colors.white : Color.fromRGBO(230, 230, 230, 1),
                        ),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        ),
                      ),
                      onPressed: () {
                        Future.delayed(
                            Duration(seconds: 1),
                            () => setState(() {
                                  toAddress = "Kaulbachstr. 123\n83472 München";
                                }));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Text(
                          toAddress ?? 'Pick',
                          style: TextStyle(color: Colors.black87),
                          maxLines: 2,
                        ),
                      )),
                ),
              ]),
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
                          onPressed: () => Navigator.pop(context)),
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
