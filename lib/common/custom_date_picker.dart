import 'package:flutter/material.dart';

class CustomDatePicker extends StatefulWidget {
  final TextEditingController textEditingController;
  final DateTime minDate;
  const CustomDatePicker(
      {super.key, required this.textEditingController, required this.minDate});

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  DateTime initDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: true,
      controller: widget.textEditingController,
      onTap: () async {
        DateTime? datePicked = await showDatePicker(
          context: context,
          initialDate: initDate,
          firstDate: widget.minDate,
          lastDate: DateTime(2100),
        );
        if (datePicked == null) {
          return;
        }
        setState(() {
          widget.textEditingController.text =
              datePicked.toString().split(" ")[0];
          initDate = datePicked;
        });
      },
      style: const TextStyle(fontSize: 16),
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      decoration: const InputDecoration(
        labelText: 'Date',
        labelStyle: TextStyle(
          fontSize: 18,
        ),
        prefixIcon: Icon(
          Icons.date_range_rounded,
          size: 20,
        ),
        errorText: null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          borderSide: BorderSide(
            color: Colors.black54,
            width: 1,
          ),
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: 5,
          vertical: 15,
        ),
      ),
    );
  }
}
