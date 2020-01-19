import 'package:flutter/material.dart';
import 'package:flutter_yourche/page/account_safety_page.dart';
import 'package:flutter_yourche/page/notification_page.dart';
import 'package:flutter_yourche/page/privacy_page.dart';
import 'package:flutter_yourche/widgets/appbar.dart';
import 'package:flutter_yourche/widgets/common_color.dart';
import 'package:flutter_yourche/widgets/divider_line.dart';
import 'package:flutter_yourche/widgets/item_view.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(c_e5e5e5),
      appBar: appbar(context, "设置"),
      body: Container(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            ItemView("账号与安全", "images/ic_account_safety.png", () {
              Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                return AccountSafetyPage();
              }));
            }),
            DividerLine(10),
            ItemView("通知提醒", "images/ic_notify.png", () {
              Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                return NotificationPage();
              }));
            }),
            ItemView("隐私", "images/ic_privacy.png", () {
              Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                return PrivacyPage();
              }));
            }),
            DividerLine(10),
            InkWell(
              child: Container(
                width: double.infinity,
                height: 56,
                color: Colors.white,
                child: Center(
                  child: Text(
                    "退出登录",
                    style: TextStyle(
                        fontSize: 18,
                        color: Color(c_ff6600),
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              onTap: () {
                //TODO 退出登录
              },
            ),
          ],
        ),
      ),
    );
  }
}
