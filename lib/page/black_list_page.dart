import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_yourche/widgets/appbar.dart';
import 'package:flutter_yourche/widgets/black_list_item.dart';

class BlackListPage extends StatefulWidget {
  @override
  _BlackListPageState createState() => _BlackListPageState();
}

class _BlackListPageState extends State<BlackListPage> {
  EasyRefreshController _controller;
  int _count = 20;

  @override
  void initState() {
    _controller = EasyRefreshController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(context, "黑名单"),
      body: EasyRefresh.custom(
        controller: _controller,
        enableControlFinishRefresh: false,
        enableControlFinishLoad: true,
        header: ClassicalHeader(),
        footer: ClassicalFooter(),
        onRefresh: () async {
          print("refresh");
          setState(() {
            _count = 20;
            _controller.resetLoadState();
          });
        },
        onLoad: () async {
          await Future.delayed(Duration(seconds: 2), () {
            print("load more");
            setState(() {
              _count += 10;
            });
            _controller.finishLoad(noMore: _count >= 40);
          });
        },
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return BlackListItemWidget(
                avatar: 'images/logo.png',
                name: "你好",
                age: "12",
                gender: (index % 2 == 0) ? "1" : "2",
                blackTime: "2020-01-09 19:00:52",
                callback: () {
                  _removeBlackItem();
                  print("解除拉黑");
                },
              );
            }, childCount: _count),
          )
        ],
      ),
      persistentFooterButtons: <Widget>[
        FlatButton(
            onPressed: () {
              _controller.callRefresh();
            },
            child: Text("Refresh", style: TextStyle(color: Colors.black))),
        FlatButton(
            onPressed: () {
              _controller.callLoad();
            },
            child: Text("Load more", style: TextStyle(color: Colors.black))),
      ],
    );
  }

  void _removeBlackItem() {
    //TODO 去BE请求接口
  }
}
