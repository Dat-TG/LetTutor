import 'package:flutter/material.dart';

class CustomDatePicker extends StatefulWidget {
  final TextEditingController textEditingController;
  final DateTime minDate;
  final String labelText;
  final bool showIcon;
  final EdgeInsetsGeometry padding;
  final double labelSize;
  final DateTime? initDate;
  final String? Function(String?, BuildContext)? validator;
  const CustomDatePicker(
      {super.key,
      required this.textEditingController,
      required this.minDate,
      required this.labelText,
      this.showIcon = true,
      this.labelSize = 18,
      this.initDate,
      this.validator,
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

  String? errorText;

  void handleBorderColor() {
    if (errorText != null) {
      _borderColor = _focusNode.hasFocus
          ? const Color.fromARGB(255, 216, 52, 40)
          : _borderColor = const Color.fromARGB(255, 221, 56, 44);
    } else {
      _borderColor =
          _focusNode.hasFocus ? Theme.of(context).primaryColor : Colors.grey;
    }
  }

  @override
  void initState() {
    super.initState();
    if (widget.initDate != null) {
      initDate = widget.initDate!;
    }
    _focusNode.addListener(() {
      setState(() {
        handleBorderColor();
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
    return Column(
      children: [
        Container(
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

                errorText = widget.validator != null
                    ? widget.validator!(
                        datePicked.toString().split(" ")[0], context)
                    : null;

                handleBorderColor();
              });
            },
            style: const TextStyle(fontSize: 16),
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            validator: (value) {
              setState(() {
                errorText = widget.validator != null
                    ? widget.validator!(value, context)
                    : null;

                handleBorderColor();
              });
              return null;
            },
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
        ),
        errorText != null
            ? Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    errorText!,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 212, 50, 39),
                      fontSize: 12,
                    ),
                  ),
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}
