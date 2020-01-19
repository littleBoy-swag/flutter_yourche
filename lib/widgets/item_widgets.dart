
import 'package:flutter/material.dart';

import 'common_color.dart';


item(String label, VoidCallback callback) {
  return Container(
    color: Colors.white,
    child: ListTile(
      title: Text(
        label,
        style: TextStyle(fontSize: 16, color: Color(c_333333)),
      ),
      trailing: Image.asset(
        'images/ic_arrow_forward.png',
        width: 6,
        height: 9,
      ),
      onTap: callback,
    ),
  );
}