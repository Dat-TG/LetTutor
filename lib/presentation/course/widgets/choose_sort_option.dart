import 'package:flutter/material.dart';

class ChooseSortOption extends StatefulWidget {
  final TextEditingController sortOptionController;
  const ChooseSortOption({super.key, required this.sortOptionController});

  @override
  State<ChooseSortOption> createState() => _ChooseSortOptionState();
}

class _ChooseSortOptionState extends State<ChooseSortOption> {
  int index = 0;
  List<String> options = [
    'None',
    'Level ascending',
    'Level decreasing',
  ];
  @override
  void initState() {
    super.initState();
    widget.sortOptionController.text = options[0];
  }

  @override
  Widget build(BuildContext context) {
    return MenuAnchor(
        menuChildren: List<MenuItemButton>.generate(
          3,
          (int id) => MenuItemButton(
              onPressed: () => setState(() {
                    index = id;
                    widget.sortOptionController.text = options[id];
                  }),
              child: SizedBox(
                width: 200,
                height: 50,
                child: ListTile(
                  tileColor: Colors.white,
                  title: Text(options[id]),
                  titleTextStyle: const TextStyle(
                    color: Colors.black,
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
            decoration: const InputDecoration(
              labelText: 'Sort By',
              labelStyle: TextStyle(
                fontSize: 18,
              ),
              prefixIcon: Icon(
                Icons.sort_rounded,
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
        });
  }
}
