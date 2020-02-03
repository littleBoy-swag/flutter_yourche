import 'package:flutter/material.dart';
import 'package:flutter_yourche/page/add_car_page.dart';
import 'package:flutter_yourche/widgets/add_car_widget.dart';
import 'package:flutter_yourche/widgets/appbar.dart';
import 'package:flutter_yourche/widgets/common_color.dart';
import 'package:flutter_yourche/widgets/divider_line.dart';
import 'package:flutter_yourche/widgets/garage_item_widget.dart';

class MyGaragePage extends StatefulWidget {
  @override
  _MyGaragePageState createState() => _MyGaragePageState();
}

class _MyGaragePageState extends State<MyGaragePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(context, "我的车库"),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
            if (index == 2) {
              return Padding(
                padding: EdgeInsets.all(16),
                child: AddCarWidget(
                  callback: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                      return AddCarPage();
                    }));
                  },
                ),
              );
            } else {
              return Padding(
                padding: EdgeInsets.only(top: 16, left: 16, right: 16),
                child: GarageItemWidget(
                  carName: "保时捷911",
                  carPlate: "苏K1****5",
                  carVerifyState: 1,
                  isNormalCar: true,
                  carImg:
                      'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1580567149864&di=9955b16ad2a7bc9a42505c688e5a31ed&imgtype=0&src=http%3A%2F%2Fimage.geni4s.com%2Fcar_photo%2F20110310%2F20110310164421_01162177.jpg',
                  callback: () {
                    _showPopWindow();
                  },
                ),
              );
            }
          }, childCount: 3)),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(bottom: 16),
              child: Center(
                child: Text(
                  "我的车库最多可存放3辆车",
                  style: TextStyle(fontSize: 12, color: Color(c_999999)),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void _showPopWindow() {
    OverlayEntry overlayEntry = OverlayEntry(builder: (context) {
      return Positioned(
        width: 160,
        height: 115,
        child: Material(
          color: Colors.white,
          child: ListView.separated(
              itemBuilder: (context, index) {
                return Container(
                  height: 57,
                  child: Center(
                    child: Text("a"),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return DividerLine(1);
              },
              itemCount: 2),
        ),
      );
    });
    Overlay.of(context).insert(overlayEntry);
    Future.delayed(Duration(seconds: 2)).then((v) {
      overlayEntry.remove();
    });
  }
}
