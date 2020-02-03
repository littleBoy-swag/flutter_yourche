import 'package:flutter/material.dart';

class MyCheckBox extends StatefulWidget {
  final bool value;

  MyCheckBox({@required this.value});

  @override
  _MyCheckBoxState createState() => _MyCheckBoxState();
}

class _MyCheckBoxState extends State<MyCheckBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
      width: 20,
      height: 20,
      child: Center(
        child: widget.value
            ? Image.asset('images/ic_check_box_checked.png')
            : Image.asset('images/ic_check_box_unchecked.png'),
      ),
    );
  }
}
