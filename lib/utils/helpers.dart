import 'package:filter_list/filter_list.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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

  static CustomTransitionPage buildPageWithDefaultTransition<T>({
    required BuildContext context,
    required GoRouterState state,
    required Widget child,
  }) {
    return CustomTransitionPage<T>(
      key: state.pageKey,
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
