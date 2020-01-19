import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_yourche/plugin/common_utils.dart';
import 'package:flutter_yourche/widgets/appbar.dart';
import 'package:flutter_yourche/widgets/common_color.dart';

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  bool _isWaiting = true;
  bool _isNotificationOn = false;

  @override
  void initState() {
    _isNotificationEnable();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(c_f5f5f5),
      appBar: appbar(context, "通知提醒"),
      body: Container(
        color: Colors.white,
        child: ListTile(
          title: Text(
            "消息通知开关",
            style: TextStyle(fontSize: 16, color: Color(c_333333)),
          ),
          subtitle: Text("关闭后将不会收到任何消息推送",
              style: TextStyle(fontSize: 12, color: Color(c_999999))),
          trailing: _isWaiting
              ? CupertinoActivityIndicator()
              : _isNotificationOn
                  ? Text(
                      "已开启",
                      style: TextStyle(fontSize: 16, color: Color(c_333333)),
                    )
                  : InkWell(
                      onTap: () {
                        CommonUtils.go2NotificationSettings();
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            "去开启",
                            style:
                                TextStyle(fontSize: 16, color: Color(c_333333)),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Image.asset(
                            'images/ic_arrow_forward.png',
                            width: 6,
                            height: 9,
                          ),
                        ],
                      ),
                    ),
        ),
      ),
    );
  }

  void _isNotificationEnable() async {
    _isNotificationOn = await CommonUtils.isNotificationEnable();
    setState(() {
      _isWaiting = false;
    });
  }
}
