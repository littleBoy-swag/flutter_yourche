import 'package:flutter/material.dart';
import 'package:flutter_yourche/page/car_search_page.dart';

class CarPickPage extends StatefulWidget {
  @override
  _CarPickPageState createState() => _CarPickPageState();
}

class _CarPickPageState extends State<CarPickPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "车辆型号",
          style: TextStyle(fontSize: 18, color: Colors.black),
        ),
        leading: InkWell(
          child: Icon(
            Icons.arrow_back_ios,
            size: 24,
            color: Colors.black,
          ),
          onTap: () {
            Navigator.of(context).maybePop();
          },
        ),
        actions: <Widget>[
          IconButton(
              icon: new Icon(
                Icons.search,
                color: Colors.black,
              ),
              tooltip: '搜索车辆品牌车系',
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                  return CarSearchPage();
                }));
              }),
        ],
      ),
      body: Container(
        child: Center(
          child: Text("车辆型号"),
        ),
      ),
    );
  }
}
