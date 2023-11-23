import 'package:flutter/material.dart';

class CustomDatePicker extends StatefulWidget {
  final TextEditingController textEditingController;
  final DateTime minDate;
  final String labelText;
  final bool showIcon;
  final EdgeInsetsGeometry padding;
  final double labelSize;
  final DateTime? initDate;
  const CustomDatePicker(
      {super.key,
      required this.textEditingController,
      required this.minDate,
      required this.labelText,
      this.showIcon = true,
      this.labelSize = 18,
      this.initDate,
      this.padding = const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 15,
      )});

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  DateTime initDate = DateTime.now();
  // Use it to change color for border when textFiled in focus
  final FocusNode _focusNode = FocusNode();

  // Color for border
  Color _borderColor = Colors.grey;

  @override
  void initState() {
    super.initState();
    if (widget.initDate != null) {
      initDate = widget.initDate!;
    }
    // Change color for border if focus was changed
    _focusNode.addListener(() {
      setState(() {
        _borderColor =
            _focusNode.hasFocus ? Theme.of(context).primaryColor : Colors.grey;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: _borderColor),
        borderRadius: BorderRadius.circular(5),
      ),
      child: TextFormField(
        focusNode: _focusNode,
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
        decoration: InputDecoration(
          labelText: widget.labelText,
          labelStyle: TextStyle(
            fontSize: widget.labelSize,
          ),
          prefixIcon: widget.showIcon
              ? const Icon(
                  Icons.date_range_rounded,
                  size: 20,
                )
              : null,
          errorText: null,
          border: InputBorder.none,
          contentPadding: widget.padding,
        ),
      ),
    );
  }
}
