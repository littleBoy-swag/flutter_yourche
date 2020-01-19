import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  final VoidCallback callback;
  final String content;
  final double height;
  final double width;
  final double fontSize;

  CommonButton(
      {@required this.callback,
      @required this.content,
      this.width = double.infinity,
      this.height = 44,
      this.fontSize = 18});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: RaisedButton(
        color: Color.fromARGB(255, 255, 102, 0),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(height / 2))),
        child: Text(
          content,
          style: TextStyle(color: Colors.white, fontSize: fontSize),
        ),
        onPressed: callback,
      ),
    );
  }
}
