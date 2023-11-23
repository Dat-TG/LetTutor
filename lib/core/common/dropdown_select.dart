import 'package:flutter/material.dart';

class DropdownSelect extends StatefulWidget {
  final List<String> options;
  final String? labelText;
  final Function? setValue;
  final String? initialValue;
  const DropdownSelect(
      {super.key,
      required this.options,
      this.labelText,
      this.setValue,
      this.initialValue});

  @override
  State<DropdownSelect> createState() => _DropdownSelectState();
}

class _DropdownSelectState extends State<DropdownSelect> {
  String? dropdownValue;

  @override
  void initState() {
    if (widget.initialValue != null) {
      dropdownValue = widget.initialValue;
    } else {
      dropdownValue = widget.options.first;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<String>(
      label: widget.labelText != null
          ? Text(
              widget.labelText!,
              style: const TextStyle(
                fontSize: 16,
              ),
            )
          : null,
      initialSelection: dropdownValue,
      onSelected: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value;
        });
      },
      dropdownMenuEntries:
          widget.options.map<DropdownMenuEntry<String>>((String value) {
        return DropdownMenuEntry<String>(value: value, label: value);
      }).toList(),
    );
  }
}
