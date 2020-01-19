import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_yourche/widgets/common_text_style.dart';
import 'package:flutter_yourche/widgets/divider_line.dart';

import 'common_color.dart';

showDialogWithTitle(BuildContext context, String title, String content,
    Function cancel, Function confirm) {
  showDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text(
            title,
            style: TextStyle(
                fontSize: 17,
                color: Color(c_333333),
                fontWeight: FontWeight.bold),
          ),
          content: Text(
            content,
            style: TextStyle(fontSize: 16, color: Color(c_666666)),
          ),
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                cancel();
                Navigator.of(context).pop();
              },
              child: new Text(
                "取消",
                style: TextStyle(
                    color: Color(c_666666),
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
            FlatButton(
              onPressed: () {
                confirm();
                Navigator.of(context).pop();
              },
              child: new Text(
                "确定",
                style: TextStyle(
                    color: Color(c_ff6600),
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        );
      });
}

showDialogWithoutTitle(BuildContext context, String title, String content,
    Function cancel, Function confirm) {
  showDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text(title),
          content: Text(
            content,
            style: TextStyle(fontSize: 16, color: Color(c_666666)),
          ),
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                cancel();
                Navigator.of(context).pop();
              },
              child: new Text(
                "取消",
                style: TextStyle(
                    color: Color(c_666666),
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
            FlatButton(
              onPressed: () {
                confirm();
                Navigator.of(context).pop();
              },
              child: new Text(
                "确定",
                style: TextStyle(
                    color: Color(c_ff6600),
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        );
      });
}

showSelectDialogWithTwoItem(BuildContext context, String label1, Function func1,
    String label2, Function func2) {
  showModalBottomSheet(
      context: context,
      builder: (_) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            InkWell(
              child: Container(
                alignment: Alignment.center,
                color: Colors.white,
                width: double.infinity,
                height: 48,
                child: Text(
                  label1,
                  style: dialogTextStyle,
                ),
              ),
              onTap: () {
                func1();
                Navigator.of(context).pop();
              },
            ),
            DividerLine(1),
            InkWell(
              child: Container(
                alignment: Alignment.center,
                color: Colors.white,
                width: double.infinity,
                height: 48,
                child: Text(
                  label2,
                  style: dialogTextStyle,
                ),
              ),
              onTap: () {
                func2();
                Navigator.of(context).pop();
              },
            ),
            DividerLine(10),
            InkWell(
              child: Container(
                alignment: Alignment.center,
                color: Colors.white,
                width: double.infinity,
                height: 48,
                child: Text(
                  "取消",
                  style: dialogCancelTextStyle,
                ),
              ),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      });
}
