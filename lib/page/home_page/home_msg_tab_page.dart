import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_yourche/page/mine_page.dart';
import 'package:flutter_yourche/page/search_user_page.dart';
import 'package:flutter_yourche/widgets/common_color.dart';

class HomeMsgTabPage extends StatefulWidget {
  @override
  _HomeMsgTabPageState createState() => _HomeMsgTabPageState();
}

class _HomeMsgTabPageState extends State<HomeMsgTabPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(c_f5f5f5),
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        leading: GestureDetector(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: ClipOval(
              child: Image.asset(
                'images/ic_default_avatar.png',
              ),
            ),
          ),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (_) {
              return MinePage();
            }));
          },
        ),
        title: Text(
          "消息",
          style: TextStyle(fontSize: 18, color: Colors.black),
        ),
        centerTitle: true,
        actions: <Widget>[
          Row(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                    return SearchUserPage();
                  }));
                },
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Image.asset(
                    'images/ic_add_user.png',
                    width: 18,
                    height: 18,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          // 可以添加多个 SliverToBoxAdapter(),
          SliverToBoxAdapter(
            child: Container(
              color: Colors.white,
              height: 48,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 16, right: 10),
                        child: Image.asset(
                          'images/ic_msg_notification.png',
                          width: 15,
                          height: 18,
                        ),
                      ),
                      Text(
                        "动态通知",
                        style: TextStyle(
                            fontSize: 16,
                            color: Color(c_333333),
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Visibility(
                        child: Container(
                          child: ClipOval(
                            child: Container(
                              color: Colors.red,
                              width: 9,
                              height: 9,
                            ),
                          ),
                        ),
                        visible: true,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10, right: 16),
                        child: Image.asset(
                          'images/ic_arrow_forward.png',
                          width: 6,
                          height: 9,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              color: Color(c_f5f5f5),
              width: double.infinity,
              height: 10,
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              if (index % 2 == 0) {
                return _chatItem('images/ic_msg_notification_robot.png');
              } else {
                return _chatItem('images/ic_default_avatar.png');
              }
            }, childCount: 12),
          )
        ],
      ),
    );
  }

  Widget _chatItem(String img) {
    return Container(
      color: Colors.white,
      child: Row(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 12, bottom: 12, left: 16, right: 10),
            child: ClipOval(
              child: Image.asset(
                img,
                width: 44,
                height: 44,
              ),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Your车小秘书",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(c_333333)),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                "今日给你推送一则神秘的消息...",
                style: TextStyle(
                  fontSize: 12,
                  color: Color(c_999999),
                ),
              )
            ],
          ),
          Expanded(child: Container()),
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Text(
              "5分钟前",
              style: TextStyle(
                color: Color(c_999999),
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
