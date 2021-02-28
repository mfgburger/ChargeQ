import 'package:flutter/material.dart';

/// A ChargeQ-Style dropdown button.
class CustomDropdownButton extends StatelessWidget {
  // The current value.
  final String value;
  // What should be done when a selection has been changed.
  final Function(String) onChanged;
  // The list of items to be shown in the dropdown.
  final List<String> items;

  const CustomDropdownButton({required this.value, required this.onChanged, required this.items});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
        child: Container(
            height: 30,
            margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            padding: EdgeInsets.symmetric(horizontal: 5),
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.black26, width: 1.0, style: BorderStyle.solid),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
            ),
            child: DropdownButton<String>(
              value: value,
              hint: Center(
                  child: Text(
                "Select",
                style: TextStyle(fontSize: 15, color: Colors.black26),
              )),
              items: items.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Text(value),
                  ),
                );
              }).toList(),
              onChanged: (value) {
                if (value != null) onChanged(value);
              },
            )));
  }
}
