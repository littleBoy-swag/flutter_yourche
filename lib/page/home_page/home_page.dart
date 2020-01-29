import 'package:flutter/material.dart';
import 'package:flutter_yourche/page/camera_page.dart';
import 'package:flutter_yourche/widgets/common_color.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
      bottomNavigationBar: BottomAppBar(
        elevation: 1,
        child: Container(
          height: 48,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              InkWell(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                    return CameraPage();
                  }));
                },
                child: Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Image.asset('images/ic_moments_pressed.png',width: 22,height: 22,),
                      SizedBox(height: 5,),
                      Text("首页",style: TextStyle(color: Color(c_ff6600),fontSize: 10),)
                    ],
                  ),
                ),
              ),
              Container(),
              Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Image.asset('images/ic_msg_normal.png',width: 22,height: 22,),
                    SizedBox(height: 5,),
                    Text("消息",style: TextStyle(color: Color(c_666666),fontSize: 10),)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
