import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_yourche/widgets/common_color.dart';
import 'package:flutter_yourche/widgets/divider_line.dart';

typedef void CityPickerCallback(
    String province, String provCode, String city, String cityCode);

class CityPicker {
  static showCityPicker(BuildContext context, CityPickerCallback callback) {
    rootBundle.loadString('data/city.json').then((value) {
      List data = json.decode(value);
      int provinceIndex = 0;
      // 给city赋值
      List city = List();
      List list = data[provinceIndex]["sub"];
      city.addAll(list);
      //controller
      FixedExtentScrollController _provController =
          FixedExtentScrollController();
      FixedExtentScrollController _cityController =
          FixedExtentScrollController();
      //需要返回的值
      String _provStr = "";
      String _provCode = "";
      String _cityStr = "";
      String _cityCode = "";
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return StatefulBuilder(
              builder: (context, state) {
                return Container(
                  color: Colors.white,
                  width: double.infinity,
                  height: 250,
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 44,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            InkWell(
                              onTap: () {
                                Navigator.of(context).maybePop();
                              },
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 10),
                                child: Text(
                                  "取消",
                                  style: TextStyle(
                                      color: Color(c_999999), fontSize: 16),
                                ),
                              ),
                            ),
                            Text(
                              "请选择家乡",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Color(c_333333)),
                            ),
                            InkWell(
                              onTap: () {
                                _provStr = data[provinceIndex]["name"];
                                _provCode = data[provinceIndex]["code"];
                                _cityStr =
                                    city[_cityController.selectedItem]["name"];
                                _cityCode =
                                    city[_cityController.selectedItem]["code"];
//                                print(
//                                    "$_provCode-$_provStr,$_cityCode-$_cityStr");
                                callback(
                                    _provStr, _provCode, _cityStr, _cityCode);
                                Navigator.maybePop(context);
                              },
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 10),
                                child: Text(
                                  "确定",
                                  style: TextStyle(
                                      color: Color(c_ff6600), fontSize: 16),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      DividerLine(1),
                      Row(
                        children: <Widget>[
                          _itemList(_provController, data, (pos) {
                            state(() {
                              provinceIndex = pos;
                              city.clear();
                              city.addAll(data[provinceIndex]["sub"]);
                              _cityController.jumpToItem(0);
                            });
                          }),
                          _itemList(_cityController, city, (pos) {
                            //
                          }),
                        ],
                      )
                    ],
                  ),
                );
              },
            );
          });
    });
  }

  static Widget _itemList(
      FixedExtentScrollController controller, List list, Function function) {
    return Expanded(
      flex: 1,
      child: Container(
        height: 200,
        child: CupertinoPicker(
          scrollController: controller,
          backgroundColor: Colors.white,
          itemExtent: 40,
          onSelectedItemChanged: (pos) {
            function(pos);
          },
          children: list.map((v) {
            return Align(
              alignment: Alignment.center,
              child: Text(
                v['name'],
                style: TextStyle(
                  fontSize: 19,
                  color: Color(c_333333),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
