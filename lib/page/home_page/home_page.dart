import 'package:flutter/material.dart';
import 'package:flutter_yourche/page/camera_page.dart';
import 'package:flutter_yourche/page/home_page/home_moments_tab_page.dart';
import 'package:flutter_yourche/page/home_page/home_msg_tab_page.dart';
import 'package:flutter_yourche/widgets/common_color.dart';
import 'package:flutter_yourche/widgets/update/update_util.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  final _tabTextSelected = TextStyle(color: Color(c_ff6600), fontSize: 10);
  final _tabTextNormal = TextStyle(color: Color(c_666666), fontSize: 10);

  var _tabIndex = 0;
  var _pages;
  var _tabImages;

  Image _getTabImage(path) {
    return Image.asset(path, width: 22, height: 22);
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      UpdateUtil.checkUpdate(context);
    });
    _pages = <Widget>[HomeMomentsTabPage(), HomeMsgTabPage()];
    if (_tabImages == null) {
      _tabImages = [
        [
          _getTabImage('images/ic_moments_normal.png'),
          _getTabImage('images/ic_moments_pressed.png')
        ],
        [
          _getTabImage('images/ic_msg_normal.png'),
          _getTabImage('images/ic_msg_pressed.png')
        ],
      ];
    }
  }

  TextStyle _getTabTextStyle(int curIndex) {
    if (curIndex == _tabIndex) {
      return _tabTextSelected;
    }
    return _tabTextNormal;
  }

  Image _getTabIcon(int curIndex) {
    if (curIndex == _tabIndex) {
      return _tabImages[curIndex][1];
    }
    return _tabImages[curIndex][0];
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: IndexedStack(
        children: _pages,
        index: _tabIndex,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (_) {
            return CameraPage();
          }));
        },
        elevation: 0,
        backgroundColor: Colors.white,
        child: Image.asset(
          'images/ic_moments_camera.png',
          width: 51,
          height: 51,
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 2,
        child: Container(
          height: 48,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  setState(() {
                    _tabIndex = 0;
                  });
                },
                child: Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      _getTabIcon(0),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "首页",
                        style: _getTabTextStyle(0),
                      )
                    ],
                  ),
                ),
              ),
              //占位
              Container(
                width: 51,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _tabIndex = 1;
                  });
                },
                child: Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      _getTabIcon(1),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "消息",
                        style: _getTabTextStyle(1),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
