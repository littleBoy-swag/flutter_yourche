import 'package:flutter/material.dart';

class HomeMomentsTabPage extends StatefulWidget {
  @override
  _HomeMomentsTabPageState createState() => _HomeMomentsTabPageState();
}

class _HomeMomentsTabPageState extends State<HomeMomentsTabPage> {
  String txt = "a";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        child: Center(
          child: Text(txt),
        ),
        onTap: () {
          setState(() {
            txt = "b";
          });
        },
      ),
    );
  }
}
