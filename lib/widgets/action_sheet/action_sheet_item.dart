import 'package:flutter/material.dart';
import 'package:flutter_yourche/widgets/common_color.dart';

class ActionSheetItem extends StatelessWidget {
  final String label;
  final VoidCallback callback;

  ActionSheetItem({@required this.label, @required this.callback});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        callback();
        Navigator.of(context).pop();
      },
      child: Container(
        color: Colors.white,
        height: 48,
        width: double.infinity,
        child: Center(
          child: Text(
            label,
            style: TextStyle(
                fontSize: 16,
                color: Color(c_333333),
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
