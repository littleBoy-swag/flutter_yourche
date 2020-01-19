import 'package:flutter/material.dart';
import 'package:flutter_yourche/widgets/common_color.dart';

class DividerLine extends StatelessWidget {
  final double height;

  DividerLine(this.height);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(c_f5f5f5),
      width: double.infinity,
      height: this.height,
    );
  }
}
