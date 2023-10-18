import 'package:filter_list/filter_list.dart';
import 'package:flutter/material.dart';

class Helpers {
  static void openFilterDialog(BuildContext context, List<String> list,
      List<String> selectedList, Function callback) async {
    await FilterListDialog.display<String>(
      context,
      choiceChipLabel: (p0) => p0,
      listData: list,
      selectedListData: selectedList,
      validateSelectedItem: (list, val) => list!.contains(val),
      onItemSearch: (data, query) {
        return data.toLowerCase().contains(query.toLowerCase());
      },
      onApplyButtonClick: (list) {
        callback(list);
        Navigator.pop(context);
      },
    );
  }
}
