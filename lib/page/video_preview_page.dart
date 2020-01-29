import 'package:flutter/material.dart';
import 'package:flutter_yourche/widgets/common_color.dart';

class VideoPreviewPage extends StatefulWidget {
  @override
  _VideoPreviewPageState createState() => _VideoPreviewPageState();
}

class _VideoPreviewPageState extends State<VideoPreviewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            bottom: 58,
            child: GestureDetector(
              onTap: () {},
              child: Container(
                width: 80,
                height: 44,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(c_ff9e13),
                      Color(c_ff6600),
                    ],
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(22)),
                ),
                child: Center(
                  child: Text(
                    "发动态",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
