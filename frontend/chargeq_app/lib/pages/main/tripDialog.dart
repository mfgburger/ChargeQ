import 'package:chargeq_app/assets/images/image.dart';
import 'package:chargeq_app/pages/main/customDropdownButton.dart';
import 'package:chargeq_app/pages/main/popupData.dart';
import 'package:chargeq_app/res/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_map_location_picker/google_map_location_picker.dart';
import 'package:intl/intl.dart';

class TripDialog extends StatefulWidget {
  bool isPriority;

  @override
  State<StatefulWidget> createState() => _TripDialogState();

  TripDialog({this.isPriority});
}

class _TripDialogState extends State<TripDialog> {
  PopupData popupData;
  DateTime selectedDate;
  TimeOfDay selectedTime;
  LocationResult fromAddress, toAddress;

  var dateFormat = DateFormat('yyyy-MM-dd');

  @override
  void initState() {
    super.initState();
    popupData = PopupData(isPriority: widget.isPriority);
  }

  Future<Null> _selectLocation(
      BuildContext context, LocationResult storeVar) async {
    LocationResult result = await showLocationPicker(
        context, "AIzaSyC-R_Gy32Z1RtWTu8b3eDCVywpAa8iUGK0");
    if (result != null && result != storeVar)
      setState(() {
        storeVar = result;
      });
  }

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
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
    final TimeOfDay picked =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
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
          Align(
              alignment: Alignment.bottomRight,
              child: addTripCorner(MediaQuery.of(context).size.width * 0.55)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 5),
                child: Text("I'm travelling because...",
                    style: TextStyle(fontWeight: FontWeight.w600)),
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
                      color: selectedDate == null
                          ? Color.fromRGBO(230, 230, 230, 1)
                          : Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      onPressed: () {
                        _selectDate(context);
                      },
                      child: Text(selectedDate != null
                          ? dateFormat.format(selectedDate)
                          : 'Select date'),
                    ),
                  ),
                  Text("at"),
                  Container(
                    height: 30,
                    margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                    child: RaisedButton(
                      color: selectedTime == null
                          ? Color.fromRGBO(230, 230, 230, 1)
                          : Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      onPressed: () {
                        _selectTime(context);
                      },
                      child:
                          Text(selectedTime?.format(context) ?? 'Select time'),
                    ),
                  ),
                ],
              ),
              Row(children: [
                Text("from "),
                Container(
                  height: 30,
                  margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                  child: RaisedButton(
                    color: fromAddress == null
                        ? Color.fromRGBO(230, 230, 230, 1)
                        : Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    onPressed: () {
                      _selectLocation(context, fromAddress);
                    },
                    child: Text(fromAddress?.address ?? 'Pick'),
                  ),
                ),
              ]),
              Row(children: [
                Text("to "),
                Container(
                  height: 30,
                  margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                  child: RaisedButton(
                    color: toAddress == null
                        ? Color.fromRGBO(230, 230, 230, 1)
                        : Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    onPressed: () {
                      _selectLocation(context, toAddress);
                    },
                    child: Text(toAddress?.address ?? 'Pick'),
                  ),
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
                      child: Text("Cancel",
                          style: TextStyle(color: Colors.black87)),
                      onPressed: () => Navigator.pop(context),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          color: myGreen,
                          child: Text("Save",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600)),
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
