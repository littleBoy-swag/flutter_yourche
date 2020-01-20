import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_yourche/page/edit_profile_page.dart';
import 'package:flutter_yourche/widgets/common_color.dart';

class OwnerMainPage extends StatefulWidget {
  @override
  _OwnerMainPageState createState() => _OwnerMainPageState();
}

class _OwnerMainPageState extends State<OwnerMainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            elevation: 0,
            backgroundColor: Colors.blueAccent,
            primary: true,
            forceElevated: true,
            automaticallyImplyLeading: true,
            snap: false,
            expandedHeight: 275,
            floating: false,
            pinned: true,
            leading: InkWell(
              child: Icon(
                Icons.arrow_back_ios,
                size: 24,
                color: Colors.white,
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
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                      return EditProfilePage();
                    }));
                  },
                  child: Center(
                    child: Text(
                      "编辑",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                'images/ic_bg_main_page.png',
                fit: BoxFit.fill,
              ),
            ),
          ),
          SliverFixedExtentList(
            itemExtent: 310,
            delegate: SliverChildBuilderDelegate((context, index) {
              return Container(
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.only(left: 16, right: 16, top: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(bottom: 8),
                        child: Text(
                          "认证车辆",
                          style: TextStyle(
                              fontSize: 17,
                              color: Color(c_333333),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      _itemInfo("座驾", "宝马"),
                      _itemInfo("车牌照", "苏A****1"),
                      Padding(
                        padding: EdgeInsets.only(bottom: 8,top: 30),
                        child: Text(
                          "个人信息",
                          style: TextStyle(
                              fontSize: 17,
                              color: Color(c_333333),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      _itemInfo("家乡", "江苏-南京"),
                      _itemInfo("星座", "射手座"),
                      _itemInfo("签名", "欲买桂花同载酒，终不似少年游"),
                      _itemInfo("身份信息", "已认证"),
                    ],
                  ),
                ),
              );
            }, childCount: 1),
          ),
        ],
      ),
    );
  }

  Widget _itemInfo(String label, String value) {
    return Padding(
      padding: EdgeInsets.only(top: 8, bottom: 8),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              label,
              style: TextStyle(fontSize: 15, color: Color(c_666666)),
            ),
            Text(
              value,
              style: TextStyle(fontSize: 15, color: Color(c_333333)),
            ),
          ],
        ),
      ),
    );
  }
}
