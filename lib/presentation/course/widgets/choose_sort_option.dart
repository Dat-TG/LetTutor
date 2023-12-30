import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ChooseSortOption extends StatefulWidget {
  final TextEditingController sortOptionController;
  final List<MapEntry<String, String>> sortOptions;
  const ChooseSortOption(
      {super.key,
      required this.sortOptionController,
      required this.sortOptions});

  @override
  State<ChooseSortOption> createState() => _ChooseSortOptionState();
}

class _ChooseSortOptionState extends State<ChooseSortOption> {
  int index = 0;
  final TextEditingController displayText = TextEditingController();

  @override
  void initState() {
    super.initState();
    widget.sortOptionController.text = widget.sortOptions[0].key;
    displayText.text = widget.sortOptions[0].value;
  }

  @override
  Widget build(BuildContext context) {
    return MenuAnchor(
        menuChildren: List<MenuItemButton>.generate(
          3,
          (int id) => MenuItemButton(
              onPressed: () => setState(() {
                    index = id;
                    widget.sortOptionController.text =
                        widget.sortOptions[id].key;
                    displayText.text = widget.sortOptions[id].value;
                  }),
              child: SizedBox(
                width: 200,
                height: 50,
                child: ListTile(
                  tileColor: Theme.of(context).splashColor,
                  title: Text(widget.sortOptions[id].value),
                  titleTextStyle: TextStyle(
                    fontSize: 18,
                    color: Theme.of(context).iconTheme.color,
                  ),
                ),
              )),
        ),
        builder:
            (BuildContext context, MenuController controller, Widget? child) {
          return TextField(
            controller: displayText,
            readOnly: true,
            onTap: () {
              if (controller.isOpen) {
                controller.close();
              } else {
                controller.open();
              }
            },
            style: const TextStyle(fontSize: 16),
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              labelText: AppLocalizations.of(context)!.sortBy,
              labelStyle: const TextStyle(
                fontSize: 18,
              ),
              prefixIcon: const Icon(
                Icons.sort_rounded,
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
        });
  }
}
