import 'package:flutter/material.dart';

class CustomTimePicker extends StatefulWidget {
  final TextEditingController textEditingController;
  final String label;
  const CustomTimePicker(
      {super.key, required this.textEditingController, required this.label});

  @override
  State<CustomTimePicker> createState() => _CustomTimePickerState();
}

class _CustomTimePickerState extends State<CustomTimePicker> {
  TimeOfDay initTime = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: true,
      controller: widget.textEditingController,
      onTap: () async {
        TimeOfDay? timePicked = await showTimePicker(
          context: context,
          initialTime: initTime,
          initialEntryMode: TimePickerEntryMode.input,
          builder: (BuildContext context, Widget? child) {
            return MediaQuery(
              data:
                  MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
              child: child!,
            );
          },
        );
        if (timePicked == null) {
          return;
        }
        setState(() {
          widget.textEditingController.text =
              '${timePicked.hour.toString().padLeft(2, '0')}:${timePicked.minute.toString().padLeft(2, '0')}';
          initTime = timePicked;
        });
      },
      style: const TextStyle(fontSize: 16),
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        labelText: widget.label,
        labelStyle: const TextStyle(
          fontSize: 18,
        ),
        prefixIcon: const Icon(
          Icons.access_time_filled_rounded,
          size: 20,
        ),
        errorText: null,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          borderSide: BorderSide(
            color: Colors.black54,
            width: 1,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 5,
          vertical: 15,
        ),
      ),
    );
  }
}
