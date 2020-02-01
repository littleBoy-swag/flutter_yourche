import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDatePicker {
  static showDatePicker(BuildContext context) {
    var picker = CupertinoPicker(
        itemExtent: 50, onSelectedItemChanged: (pos) {}, children: [
          Center(child: Text("a"),),
          Center(child: Text("b"),),
          Center(child: Text("c"),),
    ]);

    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            color: Colors.white,
            height: 250,
            child: picker,
          );
        });
  }
}
