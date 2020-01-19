import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_yourche/page/mine_page.dart';
import 'package:flutter_yourche/page/normal_login_page.dart';
import 'package:flutter_yourche/widgets/common_color.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Timer _timer;

  @override
  void initState() {
    _countDown();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
              top: 180,
              child: Image.asset(
                'images/logo.png',
                width: 100,
                height: 100,
              )),
          Positioned(
              bottom: 120,
              child: Image.asset(
                'images/ic_splash_slogan.png',
                width: 229,
                height: 66,
              )),
          Positioned(
            bottom: 15,
            child: Text(
              "©${DateTime.now().year} 南京三百云信息科技有限公司",
              style: TextStyle(fontSize: 11, color: Color(c_666666)),
            ),
          )
        ],
      ),
    );
  }

  void _countDown() {
    if (_timer == null) {
      //三秒后跳转
      _timer = Timer(Duration(seconds: 3), () {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (_) {
          return NormalLoginPage();
        }), (route) => route == null);
      });
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    _timer = null;
    super.dispose();
  }
}
