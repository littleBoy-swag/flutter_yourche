import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_yourche/widgets/common_color.dart';
import 'package:flutter_yourche/widgets/divider_line.dart';

import 'gender_widget.dart';

class FilterBottomDialog {
  BuildContext _context;

  String _gender = "0";
  bool _checked = false;
  double _sliderValue = 18;

  FilterBottomDialog(BuildContext context) {
    this._context = context;
  }

  void show() {
    showModalBottomSheet(
      context: _context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, state) {
            return Container(
              color: Colors.white,
              width: double.infinity,
              height: 280,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Container(
                      width: double.infinity,
                      height: 44,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          InkWell(
                            child: Text(
                              "取消",
                              style: TextStyle(
                                  fontSize: 16, color: Color(c_666666)),
                            ),
                            onTap: () {
                              Navigator.of(context).maybePop();
                            },
                          ),
                          Text(
                            "筛选",
                            style: TextStyle(
                                fontSize: 18,
                                color: Color(c_333333),
                                fontWeight: FontWeight.bold),
                          ),
                          InkWell(
                            child: Text(
                              "确定",
                              style: TextStyle(
                                  fontSize: 16, color: Color(c_ff6600)),
                            ),
                            onTap: () {
                              // TODO 确定
                              Navigator.of(context).maybePop();
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                      width: double.infinity,
                      height: 1,
                      color: Color(c_f0f0f0)),
                  Padding(
                      padding: EdgeInsets.only(top: 10, left: 16, bottom: 8),
                      child: Text(
                        "想看到的用户",
                        style: TextStyle(
                            fontSize: 17,
                            color: Color(c_333333),
                            fontWeight: FontWeight.bold),
                      )),
                  Container(
                    width: double.infinity,
                    height: 36,
                    child: Row(
                      children: <Widget>[
                        SizedBox(
                          width: 16,
                        ),
                        GenderWidget(
                            text: "全部",
                            uncheckedImg: "",
                            checkedImg: "",
                            checkColor: c_ff6600,
                            checked: _gender == "0",
                            callback: () {
                              state(() {
                                _gender = "0";
                              });
                            }),
                        SizedBox(
                          width: 16,
                        ),
                        GenderWidget(
                            text: "女",
                            uncheckedImg:
                                "images/ic_gender_female_unchecked.png",
                            checkedImg: "images/ic_gender_female.png",
                            checkColor: c_ff6600,
                            checked: _gender == "1",
                            callback: () {
                              state(() {
                                _gender = "1";
                              });
                            }),
                        SizedBox(
                          width: 16,
                        ),
                        GenderWidget(
                            text: "男",
                            uncheckedImg: "images/ic_gender_male_unchecked.png",
                            checkedImg: "images/ic_gender_male.png",
                            checkColor: c_ff6600,
                            checked: _gender == "2",
                            callback: () {
                              state(() {
                                _gender = "2";
                              });
                            }),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 16, top: 15, bottom: 8),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          "年龄区间",
                          style: TextStyle(
                              fontSize: 17,
                              color: Color(c_333333),
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          _sliderValue.toStringAsFixed(0),
                          style:
                              TextStyle(fontSize: 15, color: Color(c_ff6600)),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 31,
                    child: Slider(
                        min: 18,
                        max: 50,
                        value: _sliderValue,
                        activeColor: Color(c_ff6600),
                        inactiveColor: Color(c_ff6600).withOpacity(0.3),
                        onChanged: (value) {
                          state(() {
                            _sliderValue = value;
                          });
                        }),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  DividerLine(1),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "只显示车辆认证用户",
                          style:
                              TextStyle(fontSize: 17, color: Color(c_333333)),
                        ),
                        CupertinoSwitch(
                          activeColor: Color(c_ff6600),
                          value: _checked,
                          onChanged: (bool value) {
                            state(() {
                              _checked = value;
                            });
                          },
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        );
      },
    );
  }
}
