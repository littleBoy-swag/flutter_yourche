import 'package:flutter/material.dart';
import 'package:flutter_yourche/widgets/common_color.dart';

class VoteWidget extends StatefulWidget {
  final bool checked;
  final String checkedImg;
  final String uncheckedImg;
  final String content;
  final VoidCallback callback;

  VoteWidget(
      {@required this.checked,
      @required this.content,
      @required this.checkedImg,
      @required this.uncheckedImg,
      @required this.callback});

  @override
  _VoteWidgetState createState() => _VoteWidgetState();
}

class _VoteWidgetState extends State<VoteWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Image.asset(
              widget.checked ? widget.checkedImg : widget.uncheckedImg,
              width: 19,
              height: 19,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 6),
              child: Text(
                widget.content,
                style: TextStyle(fontSize: 14, color: Color(c_333333)),
              ),
            )
          ],
        ),
      ),
      onTap: () {
        widget.callback();
      },
    );
  }
}
