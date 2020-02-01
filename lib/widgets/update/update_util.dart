import 'package:flutter/material.dart';

class UpdateUtil {
  static checkUpdate(BuildContext context) {
    _showUpdateDialog(context);
  }

  static _showUpdateDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          String label = "a";
          return StatefulBuilder(
            builder: (context, state) {
              return GestureDetector(
                child: Material(
                  child: Text(label),
                ),
                onTap: () {
                  label = "b";
                  state(() {});
                },
              );
            },
          );
        });
  }
}
