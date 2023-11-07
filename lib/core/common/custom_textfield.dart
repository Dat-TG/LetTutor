import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String? hintText;
  final String? labelText;
  final int? maxLines;
  final TextStyle? style;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool readOnly;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry margin;
  final bool? alignLabelWithHint;
  final Icon? prefixIcon;
  final double borderRadius;
  final String? Function(String?, BuildContext)? validator;
  const CustomTextField({
    super.key,
    required this.controller,
    this.hintText,
    this.labelText,
    this.maxLines = 1,
    this.style,
    this.keyboardType,
    this.textInputAction,
    this.readOnly = false,
    this.onTap,
    this.margin = const EdgeInsets.all(8),
    this.alignLabelWithHint = false,
    this.prefixIcon,
    this.borderRadius = 5,
    this.validator,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _isPasswordVisible = false;

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
    // Change color for border if focus was changed
    if (!widget.readOnly) {
      _focusNode.addListener(() {
        setState(() {
          handleBorderColor();
        });
      });
    }
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
          margin: widget.margin,
          decoration: BoxDecoration(
            border: Border.all(
                color: _borderColor, width: _focusNode.hasFocus ? 1.75 : 1),
            borderRadius: BorderRadius.circular(widget.borderRadius),
          ),
          child: TextFormField(
            onTap: widget.onTap,
            readOnly: widget.readOnly,
            focusNode: _focusNode,
            style: widget.style,
            keyboardType: widget.keyboardType,
            textInputAction: widget.textInputAction,
            controller: widget.controller,
            maxLines: widget.maxLines,
            onChanged: (value) {
              setState(() {
                errorText = widget.validator!(value, context);
                handleBorderColor();
              });
            },
            obscureText:
                (widget.labelText == AppLocalizations.of(context)!.password ||
                        widget.labelText ==
                            AppLocalizations.of(context)!.newPassword ||
                        widget.labelText ==
                            AppLocalizations.of(context)!.confirmPassword)
                    ? !_isPasswordVisible
                    : false,
            decoration: InputDecoration(
                prefixIcon: widget.prefixIcon,
                alignLabelWithHint: widget.alignLabelWithHint,
                hintText: widget.hintText,
                labelText: widget.labelText,
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 15,
                ),
                suffixIcon: (widget.labelText ==
                            AppLocalizations.of(context)!.password ||
                        widget.labelText ==
                            AppLocalizations.of(context)!.newPassword ||
                        widget.labelText ==
                            AppLocalizations.of(context)!.confirmPassword)
                    ? IconButton(
                        onPressed: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                        icon: Icon(_isPasswordVisible
                            ? Icons.visibility_off
                            : Icons.visibility))
                    : null),
            validator: (value) {
              setState(() {
                errorText = widget.validator!(value, context);
                handleBorderColor();
              });
              return null;
            },
          ),
        ),
        errorText != null
            ? Padding(
                padding: const EdgeInsets.only(left: 10),
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
