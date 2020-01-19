import 'package:flutter/material.dart';
import 'package:flutter_yourche/page/close_account_page.dart';
import 'package:flutter_yourche/page/edit_phone_page.dart';
import 'package:flutter_yourche/widgets/appbar.dart';
import 'package:flutter_yourche/widgets/common_color.dart';
import 'package:flutter_yourche/widgets/divider_line.dart';
import 'package:flutter_yourche/widgets/item_widgets.dart';

class AccountSafetyPage extends StatefulWidget {
  @override
  _AccountSafetyPageState createState() => _AccountSafetyPageState();
}

class _AccountSafetyPageState extends State<AccountSafetyPage> {
  var _ycNo = "123456";
  var _mobileNo = "18812345678";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(c_f5f5f5),
      appBar: appbar(context, "账号与安全"),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.white,
              child: ListTile(
                title: Text(
                  "Your车账号",
                  style: TextStyle(fontSize: 16, color: Color(c_333333)),
                ),
                trailing: Text(
                  _ycNo,
                  style: TextStyle(fontSize: 16, color: Color(c_333333)),
                ),
              ),
            ),
            Container(
              color: Colors.white,
              child: ListTile(
                title: Text(
                  "手机绑定",
                  style: TextStyle(fontSize: 16, color: Color(c_333333)),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      _mobileNo,
                      style: TextStyle(fontSize: 16, color: Color(c_333333)),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 12),
                      child: Image.asset(
                        'images/ic_arrow_forward.png',
                        width: 6,
                        height: 9,
                      ),
                    )
                  ],
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                    return EditPhonePage();
                  }));
                },
              ),
            ),
            DividerLine(10),
            item("账号注销", () {
              Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                return CloseAccountPage();
              }));
            })
          ],
        ),
      ),
    );
  }
}
