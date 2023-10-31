import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ExpandedParagraph extends StatefulWidget {
  final String text;
  final Color? textColor;
  const ExpandedParagraph({super.key, required this.text, this.textColor});

  @override
  State<ExpandedParagraph> createState() => _ExpandedParagraphState();
}

class _ExpandedParagraphState extends State<ExpandedParagraph> {
  String first = '';
  bool expand = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      if (widget.text.length > 135) {
        first = widget.text.substring(0, 135);
        for (int i = 0; i < 135; i++) {
          if (widget.text[i] == '\n') {
            first = widget.text.substring(0, i);
            break;
          }
        }
      } else {
        first = widget.text;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          expand = !expand;
        });
      },
      child: Container(
        child: widget.text.length == first.length
            ? Text(
                first,
                style: const TextStyle(
                  fontSize: 15,
                ),
              )
            : !expand
                ? RichText(
                    text: TextSpan(
                        text: "$first...",
                        style: TextStyle(
                          fontSize: 15,
                          color: Theme.of(context).iconTheme.color,
                        ),
                        children: [
                          WidgetSpan(
                              child: InkWell(
                            onTap: () {
                              setState(() {
                                expand = !expand;
                              });
                            },
                            child: Text(
                              textAlign: TextAlign.justify,
                              AppLocalizations.of(context)!.viewMore,
                              style: TextStyle(
                                color: widget.textColor ??
                                    Theme.of(context).primaryColor,
                                fontSize: 15,
                              ),
                            ),
                          ))
                        ]),
                  )
                : Text(
                    widget.text,
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                  ),
      ),
    );
  }
}
