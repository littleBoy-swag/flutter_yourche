import 'package:flutter/material.dart';
import 'package:flutter_yourche/page/add_car_page.dart';
import 'package:flutter_yourche/widgets/add_car_widget.dart';
import 'package:flutter_yourche/widgets/appbar.dart';

class MyGaragePage extends StatefulWidget {
  @override
  _MyGaragePageState createState() => _MyGaragePageState();
}

class _MyGaragePageState extends State<MyGaragePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(context, "我的车库"),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: AddCarWidget(
          callback: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (_) {
              return AddCarPage();
            }));
          },
        ),
      ),
    );
  }
}
