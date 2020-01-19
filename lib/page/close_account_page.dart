import 'package:flutter/material.dart';
import 'package:flutter_yourche/widgets/appbar.dart';
import 'package:flutter_yourche/widgets/common_color.dart';

class CloseAccountPage extends StatefulWidget {
  @override
  _CloseAccountPageState createState() => _CloseAccountPageState();
}

class _CloseAccountPageState extends State<CloseAccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(c_f5f5f5),
      appBar: appbar(context, "账户注销"),
      body: Padding(
        padding: EdgeInsets.only(top: 25, left: 16, right: 16),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "注销后您的账号将：",
                style: TextStyle(fontSize: 18, color: Color(c_333333)),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "1. 无法登录。",
                style: TextStyle(fontSize: 15, color: Color(c_333333)),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "2. 所有信息将被永久删除（动态、车库），你的好友无法再与你取得联系。",
                style: TextStyle(fontSize: 15, color: Color(c_333333)),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "3. 你的实名信息会解绑，解绑后可以再次绑定其他Your车号。",
                style: TextStyle(fontSize: 15, color: Color(c_333333)),
              ),
              SizedBox(
                height: 40,
              ),
              GestureDetector(
                onTap: () {
                  _closeAccount();
                },
                child: Container(
                  width: double.infinity,
                  height: 48,
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: 1,
                        color: Color(c_ff6600),
                        style: BorderStyle.solid),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Center(
                    child: Text(
                      "确认注销",
                      style: TextStyle(
                          fontSize: 18,
                          color: Color(c_ff6600),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _closeAccount() {
    // TODO 注销账号，和BE调试接口
    print("注销账号");
  }
}
