import 'package:flutter/material.dart';
import 'package:flutter_yourche/widgets/common_color.dart';

class PostMomentPage extends StatefulWidget {
  @override
  _PostMomentPageState createState() => _PostMomentPageState();
}

class _PostMomentPageState extends State<PostMomentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () {
            Navigator.of(context).maybePop();
          },
          child: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
        actions: <Widget>[
          Row(
            children: <Widget>[
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: 50,
                  height: 28,
                  decoration: BoxDecoration(
                    color: Color(c_cccccc),
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                  ),
                  child: Center(
                    child: Text(
                      "发布",
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 8,),
            ],
          ),
        ],
      ),
      body: Container(),
    );
  }
}
