import 'package:flutter/material.dart';
import 'package:flutter_yourche/widgets/appbar.dart';
import 'package:flutter_yourche/widgets/common_color.dart';

class SearchUserPage extends StatefulWidget {
  @override
  _SearchUserPageState createState() => _SearchUserPageState();
}

class _SearchUserPageState extends State<SearchUserPage> {
  TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appbar(context, "搜索用户"),
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding:
                  EdgeInsets.only(top: 20, bottom: 30, left: 16, right: 16),
              child: Container(
                height: 40,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Color(c_f5f5f5),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Image.asset(
                        'images/ic_search.png',
                        width: 16,
                        height: 16,
                      ),
                    ),
                    Expanded(
                        child: TextField(
                      controller: _controller,
                      style: TextStyle(fontSize: 16, color: Color(c_333333)),
                      decoration: InputDecoration(
                        hintText: "搜索对方昵称或者Your车号",
                        hintStyle:
                            TextStyle(fontSize: 16, color: Color(c_999999)),
                        counterText: "",
                        border: InputBorder.none,
                      ),
                      maxLines: 1,
                      maxLength: 12,
                      onSubmitted: (value) {
                        //TODO 去搜索
                        print(value);
                      },
                    )),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _inviteItem("邀请通讯录好友", "images/ic_search_contacts.png", () {
                  print("通讯录");
                }),
                _inviteItem("邀请微信好友", "images/ic_search_wechat.png", () {
                  print("wechat");
                }),
                _inviteItem("邀请QQ好友", "images/ic_search_qq.png", () {
                  print("qq");
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _inviteItem(String content, String img, Function function) {
    return GestureDetector(
      onTap: function,
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Image.asset(
              img,
              width: 65,
              height: 65,
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              content,
              style: TextStyle(
                  fontSize: 13,
                  color: Color(c_333333),
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
