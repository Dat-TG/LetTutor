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

  @override
  void initState() {
    super.initState();
    // Change color for border if focus was changed
    if (!widget.readOnly) {
      _focusNode.addListener(() {
        setState(() {
          _borderColor = _focusNode.hasFocus
              ? Theme.of(context).primaryColor
              : Colors.grey;
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
    return Container(
      margin: widget.margin,
      decoration: BoxDecoration(
        border: Border.all(color: _borderColor),
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
        obscureText: (widget.labelText ==
                    AppLocalizations.of(context)!.password ||
                widget.labelText == AppLocalizations.of(context)!.newPassword ||
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
            suffixIcon:
                (widget.labelText == AppLocalizations.of(context)!.password ||
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
          if (value == null || value.isEmpty) {
            return widget.hintText;
          }
          return null;
        },
      ),
    );
  }
}
