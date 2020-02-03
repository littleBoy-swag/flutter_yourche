import 'package:flutter/material.dart';
import 'package:flutter_yourche/widgets/appbar.dart';
import 'package:flutter_yourche/widgets/common_color.dart';
import 'package:flutter_yourche/widgets/toast.dart';

class InviteFriendPage extends StatefulWidget {
  @override
  _InviteFriendPageState createState() => _InviteFriendPageState();
}

class _InviteFriendPageState extends State<InviteFriendPage> {
  int _selectNum = 0;
  List<String> _letters = ["A", "B", "C", "D", "F", "G"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appbar(context, "邀请好友"),
      body: Stack(
        children: <Widget>[
          Positioned(
            bottom: 48,
            left: 0,
            top: 0,
            right: 0,
            child: _contactList(),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(
                  color: Color(c_f0f0f0),
                )),
              ),
              height: 48,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      child: Padding(
                        padding: EdgeInsets.only(left: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "已选$_selectNum人",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Color(c_333333),
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Text(
                              "邀请将以免费短信发出",
                              style: TextStyle(
                                  fontSize: 12, color: Color(c_ff6600)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                      child: InkWell(
                    onTap: () {
                      Toast.show(context, "已邀请");
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          Color(c_ff6600),
                          Color(c_ff9e13),
                        ]),
                      ),
                      child: Center(
                        child: Text(
                          "立即邀请",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _contactList() {
    return Container(
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            right: 0,
            child: Padding(
              padding: EdgeInsets.only(right: 4),
              child: Container(
                decoration: BoxDecoration(
                  color: Color(c_f0f0f0),
                  borderRadius: BorderRadius.all(Radius.circular(2)),
                ),
                width: 24,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: _getLetters(),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _getLetters() {
    return _letters.map((v) {
      return Text(
        v,
        style: TextStyle(fontSize: 12, color: Color(c_333333)),
      );
    }).toList();
  }
}
