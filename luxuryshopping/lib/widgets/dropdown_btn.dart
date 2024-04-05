import 'package:flutter/material.dart';

class Btn extends StatelessWidget {
  Btn(
      {super.key,
      required this.dropdownValue,
      required this.list,
      required this.onselected});
  final String? dropdownValue;
  final List<String> list;
  final void Function(String data) onselected;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Center(
        child: DropdownMenu<String>(
          // isExpanded: true,
          textStyle: TextStyle(
            backgroundColor: Theme.of(context).colorScheme.onPrimary,
            // Add other style properties as needed
          ),

          hintText: dropdownValue,
          // initialSelection: dropdownValue,
          onSelected: (String? value) {
            onselected(value!);
          },

          dropdownMenuEntries:
              list.map<DropdownMenuEntry<String>>((String value) {
            return DropdownMenuEntry<String>(value: value, label: value);
          }).toList(),
        ),
      ),
    );
  }
}
