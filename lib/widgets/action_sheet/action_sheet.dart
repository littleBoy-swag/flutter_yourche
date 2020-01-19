import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_yourche/widgets/action_sheet/action_sheet_item.dart';
import 'package:flutter_yourche/widgets/common_color.dart';
import 'package:flutter_yourche/widgets/divider_line.dart';

class ActionSheet {
  BuildContext context;

  ActionSheet(BuildContext context) {
    this.context = context;
  }

  List<ActionSheetItem> list = List<ActionSheetItem>();

  ActionSheet addItem(ActionSheetItem item) {
    list.add(item);
    return this;
  }

  void show() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 49.0 * (list.length + 1) + 10,
            width: double.infinity,
            child: Column(
              children: <Widget>[
                ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return list[index];
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return DividerLine(1);
                    },
                    itemCount: list.length),
                DividerLine(10),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    height: 49,
                    color: Colors.white,
                    child: Center(
                      child: Text(
                        "取消",
                        style: TextStyle(fontSize: 16, color: Color(c_666666)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
