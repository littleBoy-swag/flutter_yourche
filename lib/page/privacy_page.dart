import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_yourche/page/black_list_page.dart';
import 'package:flutter_yourche/widgets/appbar.dart';
import 'package:flutter_yourche/widgets/common_color.dart';
import 'package:flutter_yourche/widgets/divider_line.dart';
import 'package:flutter_yourche/widgets/item_view.dart';
import 'package:flutter_yourche/widgets/item_widgets.dart';

class PrivacyPage extends StatefulWidget {
  @override
  _PrivacyPageState createState() => _PrivacyPageState();
}

class _PrivacyPageState extends State<PrivacyPage> {
  var _scanPlate = false;
  var _momentRecommend = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(c_f5f5f5),
      appBar: appbar(context, "隐私"),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.white,
              child: ListTile(
                title: Text(
                  "扫车牌不可识别",
                  style: TextStyle(fontSize: 16, color: Color(c_333333)),
                ),
                trailing: CupertinoSwitch(
                  activeColor: Color(c_ff6600),
                  value: _scanPlate,
                  onChanged: (bool value) {
                    setState(() {
                      _scanPlate = value;
                    });
                  },
                ),
              ),
            ),
            Container(
              color: Colors.white,
              child: ListTile(
                title: Text(
                  "车辆相关动态推荐",
                  style: TextStyle(fontSize: 16, color: Color(c_333333)),
                ),
                trailing: CupertinoSwitch(
                  activeColor: Color(c_ff6600),
                  value: _momentRecommend,
                  onChanged: (bool value) {
                    setState(() {
                      _momentRecommend = value;
                    });
                  },
                ),
              ),
            ),
            DividerLine(10),
            item("黑名单", () {
              Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                return BlackListPage();
              }));
            }),
          ],
        ),
      ),
    );
  }
}
