import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_yourche/widgets/action_sheet/action_sheet.dart';
import 'package:flutter_yourche/widgets/action_sheet/action_sheet_item.dart';
import 'package:flutter_yourche/widgets/city_picker.dart';
import 'package:flutter_yourche/widgets/common_color.dart';
import 'package:flutter_yourche/widgets/divider_line.dart';
import 'package:flutter_yourche/widgets/my_date_picker.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  String gender_label = "请选择性别";
  String birthday_label = "请选择生日";
  String hometown_label = "请选择家乡";

  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "修改个人信息",
          style: TextStyle(fontSize: 18, color: Colors.black),
        ),
        leading: InkWell(
          child: Icon(
            Icons.arrow_back_ios,
            size: 24,
            color: Colors.black,
          ),
          onTap: () {
            Navigator.of(context).maybePop();
          },
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: InkWell(
              onTap: () {
                print("修改个人信息");
              },
              child: Center(
                child: Text(
                  "完成",
                  style: TextStyle(color: Color(c_ff6600), fontSize: 16),
                ),
              ),
            ),
          )
        ],
      ),
      body: CustomScrollView(
        shrinkWrap: true,
        slivers: <Widget>[
          SliverPadding(
            padding: EdgeInsets.all(0),
            sliver: SliverList(
                delegate: SliverChildListDelegate(
              <Widget>[
                Container(
                  width: double.infinity,
                  height: 170,
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      Column(
                        mainAxisSize: MainAxisSize.min,
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
                            child: ClipOval(
                              child: Image.asset(
                                'images/ic_default_avatar.png',
                                width: 69,
                                height: 69,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Text(
                            "点击设置头像",
                            style:
                                TextStyle(fontSize: 15, color: Color(c_666666)),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                DividerLine(10),
                Container(
                  child: Padding(
                    padding: EdgeInsets.only(top: 20, left: 16),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "基本信息",
                          style: TextStyle(
                              fontSize: 17,
                              color: Color(c_333333),
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Container(
                          width: double.infinity,
                          height: 48,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "昵称",
                                style: TextStyle(
                                    fontSize: 16, color: Color(c_333333)),
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 16),
                                child: Text(
                                  "九月",
                                  style: TextStyle(
                                      fontSize: 16, color: Color(c_333333)),
                                ),
                              )
                            ],
                          ),
                        ),
                        DividerLine(1),
                        _itemInfo("性别", gender_label, () {
                          ActionSheet(context)
                              .addItem(ActionSheetItem(
                                label: "男",
                                callback: () {
                                  setState(() {
                                    gender_label = "男";
                                  });
                                },
                              ))
                              .addItem(ActionSheetItem(
                                label: "女",
                                callback: () {
                                  setState(() {
                                    gender_label = "女";
                                  });
                                },
                              ))
                              .show();
                        }),
                        DividerLine(1),
                        _itemInfo("生日", birthday_label, () {
                          MyDatePicker.showDatePicker(context);
                        }),
                        DividerLine(1),
                        _itemInfo("家乡", hometown_label, () {
                          CityPicker.showCityPicker(
                              context, (prov, provCode, city, cityCode) {
                                setState(() {
                                  hometown_label = prov + " - " + city;
                                });
                          });
                        }),
                      ],
                    ),
                  ),
                ),
                DividerLine(10),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 16, right: 16, top: 20),
                        child: Text(
                          "个性签名",
                          style: TextStyle(
                              fontSize: 17,
                              color: Color(c_333333),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 8, right: 8),
                        child: TextField(
                          controller: _controller,
                          decoration: InputDecoration(
                            hintText: "签名可以帮助大家更好的认识你哦~",
                            border:
                                OutlineInputBorder(borderSide: BorderSide.none),
                            //BorderSide.none设置无边框
                            fillColor: Colors.white,
                            filled: true,
                          ),
                          textAlign: TextAlign.start,
                          maxLines: 7,
                          maxLength: 200,
                          textInputAction: TextInputAction.done,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )),
          )
        ],
      ),
    );
  }

  _itemInfo(String label, String value, Function function) {
    return InkWell(
      child: Container(
        width: double.infinity,
        height: 48,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              label,
              style: TextStyle(fontSize: 16, color: Color(c_333333)),
            ),
            Padding(
              padding: EdgeInsets.only(right: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    value,
                    style: TextStyle(fontSize: 16, color: Color(c_333333)),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Image.asset(
                    'images/ic_arrow_forward.png',
                    width: 6,
                    height: 9,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      onTap: function,
    );
  }
}
