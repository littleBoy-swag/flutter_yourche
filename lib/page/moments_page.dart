import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_yourche/widgets/appbar.dart';

class MomentsPage extends StatefulWidget {
  @override
  _MomentsPageState createState() => _MomentsPageState();
}

class _MomentsPageState extends State<MomentsPage> {
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
      appBar: appbar(context, "我的吐槽"),
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
              return Container(
                width: 60,
                height: 60,
                child: Center(
                  child: Text('$index'),
                ),
                color: index % 2 == 0 ? Colors.grey[300] : Colors.transparent,
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
}
