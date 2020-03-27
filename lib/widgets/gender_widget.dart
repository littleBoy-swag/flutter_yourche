import 'package:flutter/material.dart';
import 'package:flutter_yourche/widgets/common_color.dart';

class GenderWidget extends StatefulWidget {
  final VoidCallback callback;
  final String text;
  final bool checked;
  final String checkedImg;
  final String uncheckedImg;
  final int checkColor;

  GenderWidget(
      {@required this.text,
      @required this.uncheckedImg,
      @required this.checkedImg,
      @required this.checkColor,
      @required this.checked,
      @required this.callback});

  @override
  _GenderWidgetState createState() => _GenderWidgetState();
}

class _GenderWidgetState extends State<GenderWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          color: widget.checked ? Color(widget.checkColor) : null,
          border: widget.checked
              ? null
              : Border.all(color: Color(c_e5e5e5), width: 1),
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        height: 32,
        width: 57,
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Offstage(
                child: Padding(
                  padding: EdgeInsets.only(right: 4),
                  child: Image.asset(
                    widget.checked ? widget.checkedImg : widget.uncheckedImg,
                    width: 14,
                    height: 14,
                  ),
                ),
                offstage: widget.checkedImg == "" || widget.uncheckedImg == "",
              ),
              Text(
                widget.text,
                style: TextStyle(
                    color: widget.checked ? Colors.white : Color(c_666666),
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        widget.callback();
      },
    );
  }
}
