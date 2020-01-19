import 'package:flutter/material.dart';
import 'package:flutter_yourche/widgets/common_color.dart';

class AddCarWidget extends StatelessWidget {
  final VoidCallback callback;

  AddCarWidget({@required this.callback});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 4.0 / 3.0,
      child: InkWell(
        child: Container(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Image.asset(
                  'images/ic_cross.png',
                  width: 56,
                  height: 56,
                ),
                SizedBox(height: 16,),
                Text(
                  "添加车辆",
                  style: TextStyle(fontSize: 17, color: Color(c_666666)),
                ),
              ],
            ),
          ),
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: Color(c_e5e5e5)),
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.0)),
        ),
        onTap: callback,
      ),
    );
  }
}
