import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ChooseSortOption extends StatefulWidget {
  final TextEditingController sortOptionController;
  final List<String> sortOptions;
  const ChooseSortOption(
      {super.key,
      required this.sortOptionController,
      required this.sortOptions});

  @override
  State<ChooseSortOption> createState() => _ChooseSortOptionState();
}

class _ChooseSortOptionState extends State<ChooseSortOption> {
  int index = 0;

  @override
  void initState() {
    super.initState();
    widget.sortOptionController.text = widget.sortOptions[0];
  }

  @override
  Widget build(BuildContext context) {
    return MenuAnchor(
        menuChildren: List<MenuItemButton>.generate(
          3,
          (int id) => MenuItemButton(
              onPressed: () => setState(() {
                    index = id;
                    widget.sortOptionController.text = widget.sortOptions[id];
                  }),
              child: SizedBox(
                width: 200,
                height: 50,
                child: ListTile(
                  tileColor: Colors.white,
                  title: Text(widget.sortOptions[id]),
                  titleTextStyle: const TextStyle(
                    fontSize: 18,
                  ),
                ),
              )),
        ),
        builder:
            (BuildContext context, MenuController controller, Widget? child) {
          return TextField(
            readOnly: true,
            onTap: () {
              if (controller.isOpen) {
                controller.close();
              } else {
                controller.open();
              }
            },
            controller: widget.sortOptionController,
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
