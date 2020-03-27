import 'package:flutter/material.dart';
import 'package:flutter_yourche/widgets/action_sheet/action_sheet.dart';
import 'package:flutter_yourche/widgets/action_sheet/action_sheet_item.dart';
import 'package:flutter_yourche/widgets/appbar.dart';
import 'package:flutter_yourche/widgets/common_color.dart';
import 'package:flutter_yourche/widgets/divider_line.dart';
import 'package:flutter_yourche/widgets/gender_widget.dart';
import 'package:flutter_yourche/widgets/toast.dart';

import 'home_page/home_page.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String _gender = "0"; //1-女 2-男 0-未选择

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Color(c_f5f5f5),
      appBar: appbar(context, ""),
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Align(
            alignment: Alignment.bottomCenter,
            child: GestureDetector(
              child: Container(
                height: 48,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(c_ff6600),
                      Color(c_ff9e13),
                    ],
                  ),
                ),
                child: Center(
                  child: Text(
                    "保存",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                  return HomePage();
                }));
              },
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      ActionSheet(context)
                          .addItem(ActionSheetItem(
                            label: "拍照",
                            callback: () {
                              print("拍照");
                            },
                          ))
                          .addItem(ActionSheetItem(
                            label: "从相册选择",
                            callback: () {
                              print("从相册选择");
                            },
                          ))
                          .show();
                    },
                    child: Container(
                      width: double.infinity,
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.only(top: 35, bottom: 35),
                        child: Column(
                          children: <Widget>[
                            Image.asset(
                              'images/ic_default_avatar.png',
                              width: 69,
                              height: 69,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "点击设置头像",
                              style: TextStyle(
                                  fontSize: 15, color: Color(c_666666)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  DividerLine(10),
                  Container(
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.only(left: 16),
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: 48,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  "性别",
                                  style: TextStyle(
                                      fontSize: 16, color: Color(c_333333)),
                                ),
                                Row(
                                  children: <Widget>[
                                    GenderWidget(
                                        text: "女",
                                        checkedImg:
                                            'images/ic_gender_female.png',
                                        uncheckedImg:
                                            'images/ic_gender_female_unchecked.png',
                                        checkColor: c_ff9bc6,
                                        checked: _gender == "1",
                                        callback: () {
                                          setState(() {
                                            _gender = "1";
                                          });
                                        }),
                                    Padding(
                                      padding:
                                          EdgeInsets.only(left: 8, right: 8),
                                      child: GenderWidget(
                                          text: "男",
                                          checkedImg:
                                              'images/ic_gender_male.png',
                                          uncheckedImg:
                                              'images/ic_gender_male_unchecked.png',
                                          checkColor: c_86cdff,
                                          checked: _gender == "2",
                                          callback: () {
                                            setState(() {
                                              _gender = "2";
                                            });
                                          }),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          DividerLine(1),
                          Container(
                            height: 48,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  "昵称",
                                  style: TextStyle(
                                      fontSize: 16, color: Color(c_333333)),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 8),
                                  child: Text(
                                    "你好",
                                    style: TextStyle(
                                        fontSize: 16, color: Color(c_333333)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          DividerLine(1),
                          Container(
                            height: 48,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  "生日",
                                  style: TextStyle(
                                      fontSize: 16, color: Color(c_333333)),
                                ),
                                Row(
                                  children: <Widget>[
                                    Text(
                                      "1995.01.01",
                                      style: TextStyle(
                                          fontSize: 16, color: Color(c_333333)),
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Image.asset(
                                      'images/ic_arrow_forward.png',
                                      width: 8,
                                      height: 8,
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
