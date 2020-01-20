import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_yourche/page/mine_page.dart';
import 'package:flutter_yourche/page/normal_login_page.dart';
import 'package:flutter_yourche/page/owner_main_page.dart';
import 'package:flutter_yourche/widgets/common_button.dart';
import 'package:flutter_yourche/widgets/common_color.dart';

class OneKeyLoginPage extends StatefulWidget {
  @override
  _OneKeyLoginPageState createState() => _OneKeyLoginPageState();
}

class _OneKeyLoginPageState extends State<OneKeyLoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
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
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (_) {
                  return NormalLoginPage();
                }), (route) => route == null);
              },
              child: Center(
                child: Text(
                  "验证码登录",
                  style: TextStyle(color: Color(c_666666), fontSize: 14),
                ),
              ),
            ),
          )
        ],
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 75, bottom: 35),
              child: Image.asset(
                'images/logo.png',
                width: 72,
                height: 72,
              ),
            ),
            Text(
              "180****0998",
              style: TextStyle(
                  fontSize: 23,
                  color: Color(c_333333),
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "天翼账号提供认证服务",
              style: TextStyle(fontSize: 13, color: Color(c_999999)),
            ),
            Padding(
              padding:
                  EdgeInsets.only(top: 46, bottom: 20, left: 30, right: 30),
              child: CommonButton(
                content: "本机号码一键登录",
                callback: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (_) {
                        return MinePage();
                      }), (route) => route == null);
                },
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  "登录及表明同意",
                  style: TextStyle(fontSize: 12, color: Color(c_999999)),
                ),
                InkWell(
                  onTap: () {},
                  child: Text(
                    "《用户协议》",
                    style: TextStyle(fontSize: 12, color: Color(c_ff6600)),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Text(
                    "《隐私政策》",
                    style: TextStyle(fontSize: 12, color: Color(c_ff6600)),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  "以及",
                  style: TextStyle(fontSize: 12, color: Color(c_999999)),
                ),
                InkWell(
                  onTap: () {},
                  child: Text(
                    "《天翼服务及隐私协议》",
                    style: TextStyle(fontSize: 12, color: Color(c_ff6600)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
