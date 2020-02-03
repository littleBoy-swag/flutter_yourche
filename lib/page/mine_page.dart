import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
import 'package:flutter_yourche/page/about_us_page.dart';
import 'package:flutter_yourche/page/edit_profile_page.dart';
import 'package:flutter_yourche/page/feedback_page.dart';
import 'package:flutter_yourche/page/moments_page.dart';
import 'package:flutter_yourche/page/my_garage_page.dart';
import 'package:flutter_yourche/page/owner_main_page.dart';
import 'package:flutter_yourche/page/settings_page.dart';
import 'package:flutter_yourche/widgets/appbar.dart';
import 'package:flutter_yourche/widgets/common_color.dart';
import 'package:flutter_yourche/widgets/item_view.dart';
import 'package:flutter_yourche/widgets/share_bottom_dialog.dart';

class MinePage extends StatefulWidget {
  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  var _statusBarHeight = MediaQueryData.fromWindow (window).padding.top;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: againstStatusBarView(),
      body: Container(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                  return OwnerMainPage();
                }));
              },
              child: Container(
                width: double.infinity,
                height: 260 - _statusBarHeight,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('images/bg_mine_header.png'),
                        fit: BoxFit.cover)),
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Positioned(
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).maybePop();
                          print("返回");
                        },
                        child: Icon(Icons.arrow_back_ios),
                      ),
                      top: 20,
                      left: 16,
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ClipOval(
                          child: Image.asset(
                            'images/ic_default_avatar.png',
                            width: 69,
                            height: 69,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 14, bottom: 10),
                          child: Text(
                            "梦比糖果甜",
                            style: TextStyle(
                                fontSize: 20,
                                color: Color(c_333333),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(
                          "查看/编辑个人资料",
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(c_999999),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            ItemView("我的车库", "images/ic_garage.png", () {
              Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                return MyGaragePage();
              }));
            }),
            ItemView("我的吐槽", "images/ic_moment.png", () {
//              Navigator.of(context).push(MaterialPageRoute(builder: (_) {
//                return MomentsPage();
//              }));
            ShareBottomDialog(context).show();
            }),
            ItemView("关于我们", "images/ic_about_us.png", () {
              Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                return AboutUsPage();
              }));
            }),
            ItemView("意见与反馈", "images/ic_suggestion.png", () {
              Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                return FeedbackPage();
              }));
            }),
            ItemView("设置", "images/ic_settings.png", () {
              Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                return SettingsPage();
              }));
            }),
          ],
        ),
      ),
    );
  }
}
