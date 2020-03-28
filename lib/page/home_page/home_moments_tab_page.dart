import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_yourche/widgets/common_color.dart';
import 'package:flutter_yourche/widgets/divider_line.dart';
import 'package:flutter_yourche/widgets/filter_bottom_dialog.dart';
import 'package:flutter_yourche/widgets/moment_item_widget.dart';

import '../mine_page.dart';

class HomeMomentsTabPage extends StatefulWidget {
  @override
  _HomeMomentsTabPageState createState() => _HomeMomentsTabPageState();
}

class _HomeMomentsTabPageState extends State<HomeMomentsTabPage> {
  EasyRefreshController _controller;
  int _count = 20;
  bool _isFindTab = true;

  @override
  void initState() {
    _controller = EasyRefreshController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
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
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            GestureDetector(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  "发现",
                  style: TextStyle(
                      fontSize: _isFindTab ? 18 : 16,
                      color: _isFindTab ? Color(c_ff6600) : Color(c_666666),
                      fontWeight: FontWeight.bold),
                ),
              ),
              onTap: () {
                setState(() {
                  _isFindTab = true;
                });
              },
            ),
            SizedBox(
              width: 15,
            ),
            GestureDetector(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  "推荐",
                  style: TextStyle(
                      fontSize: !_isFindTab ? 18 : 16,
                      color: !_isFindTab ? Color(c_ff6600) : Color(c_666666),
                      fontWeight: FontWeight.bold),
                ),
              ),
              onTap: () {
                setState(() {
                  _isFindTab = false;
                });
              },
            )
          ],
        ),
        centerTitle: true,
        actions: <Widget>[
          Row(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  FilterBottomDialog(context).show();
                },
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Image.asset(
                    'images/ic_filter.png',
                    width: 18,
                    height: 18,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: EasyRefresh(
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
        child: ListView.separated(
            itemBuilder: (context, index) {
              return MomentItemWidget(
                voteChecked: false,
                unvoteChecked: true,
              );
            },
            separatorBuilder: (context, index) {
              return DividerLine(10);
            },
            itemCount: _count),
      ),
    );
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }
}
