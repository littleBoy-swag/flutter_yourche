import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_yourche/plugin/common_utils.dart';
import 'package:flutter_yourche/plugin/phone_utils.dart';
import 'package:flutter_yourche/widgets/appbar.dart';
import 'package:flutter_yourche/widgets/common_color.dart';
import 'package:flutter_yourche/widgets/dialog_widgets.dart';
import 'package:flutter_yourche/widgets/divider_line.dart';
import 'package:flutter_yourche/widgets/item_view.dart';

class AboutUsPage extends StatefulWidget {
  @override
  _AboutUsPageState createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(c_e5e5e5),
      appBar: appbar(context, "关于我们"),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 40),
                    child: Image.asset(
                      'images/logo.png',
                      height: 63,
                      width: 63,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20, bottom: 40),
                    child: Text(
                      "Your车",
                      style: TextStyle(
                          fontSize: 18,
                          color: Color(c_333333),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            DividerLine(10),
            _item("给我们评分吧", () {
              CommonUtils.rate();
            }),
            _item("用户协议", () {
              //TODO 用户协议
              print("用户协议");
            }),
            _item("隐私政策", () {
              //TODO 隐私政策
              print("隐私政策");
            }),
            Container(
              color: Colors.white,
              child: ListTile(
                title: Text(
                  "联系我们",
                  style: TextStyle(
                      fontSize: 16, color: Color.fromARGB(255, 51, 51, 51)),
                ),
                trailing: Text(
                  "400-858-7585",
                  style: TextStyle(color: Color(c_666666), fontSize: 16),
                ),
                onTap: () {
                  showDialogWithTitle(context, "提示", "确定拨打400-858-7585吗？", () {
                    //取消
                  }, () {
                    //拨打客服电话
                    PhoneUtils.diaCall("400-858-7585");
                  });
                },
              ),
            ),
            Expanded(
              child: Container(
                height: 0,
                width: 0,
              ),
            ),
            Text(
              "©${DateTime.now().year} 南京三百云信息科技有限公司",
              style: TextStyle(fontSize: 14, color: Color(c_333333)),
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }

  _item(String label, VoidCallback callback) {
    return Container(
      color: Colors.white,
      child: ListTile(
        title: Text(
          label,
          style: TextStyle(fontSize: 16, color: Color(c_333333)),
        ),
        trailing: Image.asset(
          'images/ic_arrow_forward.png',
          width: 6,
          height: 9,
        ),
        onTap: callback,
      ),
    );
  }
}
