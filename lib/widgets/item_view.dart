import 'package:flutter/material.dart';

class ItemView extends StatelessWidget {
  final String label;
  final String icon;
  final VoidCallback callback;

  ItemView(this.label, this.icon, this.callback);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListTile(
        leading: Image.asset(
          icon,
          height: 19,
          width: 19,
        ),
        title: Text(
          label,
          style:
              TextStyle(fontSize: 16, color: Color.fromARGB(255, 51, 51, 51)),
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
}
