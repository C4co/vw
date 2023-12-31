import 'package:flutter/material.dart';

sealed class VWPage {
  static Future<dynamic> open({
    ///[appBar] is the header of the page.
    required AppBar appBar,

    ///[context] is the BuildContext of the page.
    required BuildContext context,

    ///[bottomBar] is the bottom bar of the page.
    Widget? bottomBar,

    ///[body] is the body of the page.
    required Widget body,

    ///[borderRadius] is the border radius of top left and top right of the page.
    double borderRadius = 15,
  }) {
    return showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(borderRadius),
              topRight: Radius.circular(borderRadius),
            ),
          ),
          child: Scaffold(
            appBar: appBar,
            body: body,
            bottomNavigationBar: bottomBar,
          ),
        );
      },
    );
  }
}
