import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_yourche/page/invite_friend_page.dart';
import 'package:flutter_yourche/page/one_key_login_page.dart';
import 'package:flutter_yourche/page/post_moment_page.dart';
import 'package:flutter_yourche/widgets/common_button.dart';
import 'package:flutter_yourche/widgets/common_color.dart';
import 'package:flutter_yourche/widgets/divider_line.dart';

class NormalLoginPage extends StatefulWidget {
  @override
  _NormalLoginPageState createState() => _NormalLoginPageState();
}

class _NormalLoginPageState extends State<NormalLoginPage> {
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _codeController = TextEditingController();

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
                      return OneKeyLoginPage();
                    }), (route) => route == null);
              },
              child: Center(
                child: Text(
                  "一键登录",
                  style: TextStyle(color: Color(c_666666), fontSize: 14),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 48, bottom: 48),
              child: Image.asset(
                'images/logo.png',
                width: 72,
                height: 72,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15, right: 30),
              child: Container(
                width: double.infinity,
                child: Column(
                  children: <Widget>[
                    TextField(
                      controller: _phoneController,
                      maxLength: 11,
                      maxLines: 1,
                      keyboardType: TextInputType.number,
                      inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
                      decoration: InputDecoration(
                        hintText: "请输入手机号码",
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                        //BorderSide.none设置无边框
                        fillColor: Colors.white,
                        counterText: "",
                        filled: true,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    DividerLine(1),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: TextField(
                            controller: _codeController,
                            maxLength: 6,
                            maxLines: 1,
                            inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: "请输入验证码",
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none),
                              //BorderSide.none设置无边框
                              fillColor: Colors.white,
                              counterText: "",
                              filled: true,
                            ),
                            textAlign: TextAlign.start,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 30),
                          child: Text(
                            "获取验证码",
                            style:
                                TextStyle(fontSize: 15, color: Color(c_999999)),
                          ),
                        )
                      ],
                    ),
                    DividerLine(1),
                  ],
                ),
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(left: 30, right: 30, top: 42, bottom: 20),
              child: CommonButton(
                height: 48,
                content: "登录",
                callback: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                    return InviteFriendPage();
                  }));
                },
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  "登录即表明同意",
                  style: TextStyle(fontSize: 12, color: Color(c_999999)),
                ),
                InkWell(
                  child: Text(
                    "《用户协议》",
                    style: TextStyle(fontSize: 12, color: Color(c_ff6600)),
                  ),
                  onTap: () {
                    print("《用户协议》");
                  },
                ),
                InkWell(
                  child: Text(
                    "《隐私政策》",
                    style: TextStyle(fontSize: 12, color: Color(c_ff6600)),
                  ),
                  onTap: () {
                    print("《隐私政策》");
                  },
                ),
              ],
            )
          ],
        ),
      ),
      resizeToAvoidBottomPadding: false,
    );
  }
}
