import 'package:flutter/material.dart';
import 'package:flutter_yourche/widgets/appbar.dart';
import 'package:flutter_yourche/widgets/common_button.dart';
import 'package:flutter_yourche/widgets/common_color.dart';
import 'package:flutter_yourche/widgets/common_text_style.dart';

class FeedbackPage extends StatefulWidget {
  @override
  _FeedbackPageState createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appbar(context, "意见反馈"),
      body: Padding(
        padding: EdgeInsets.only(top: 15, left: 15, right: 15),
        child: Column(
          children: <Widget>[
            Text(
              "如果您在使用过程中发现任何问题，请留下您的宝贵建议和联系方式，我们将及时跟进解决。",
              style: commonTextStyle,
            ),
            Padding(
              padding: EdgeInsets.only(top: 20, bottom: 20),
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  hintText: "请输入您的反馈意见",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0),
                      borderSide: BorderSide.none), //BorderSide.none设置无边框
                  fillColor: Color(c_f5f5f5),
                  filled: true,
                ),
                textAlign: TextAlign.start,
                maxLines: 7,
                textInputAction: TextInputAction.done,
              ),
            ),
            CommonButton(
              content: "确认提交",
              callback: () {},
            )
          ],
        ),
      ),
      resizeToAvoidBottomPadding: false,
    );
  }
}
