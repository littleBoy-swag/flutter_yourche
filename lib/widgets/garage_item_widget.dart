import 'package:flutter/material.dart';
import 'package:flutter_yourche/widgets/common_color.dart';

class GarageItemWidget extends StatelessWidget {
  final String carName;
  final String carPlate;
  final int carVerifyState;
  final bool isNormalCar;
  final String carImg;
  final VoidCallback callback;

  GarageItemWidget(
      {@required this.carName,
      @required this.carPlate,
      @required this.carVerifyState,
      @required this.isNormalCar,
      @required this.carImg,
      @required this.callback});

  @override
  Widget build(BuildContext context) {
    var _stateColor;
    var _stateLabel;
    switch (carVerifyState) {
      case 0:
        {
          _stateColor = Color(c_999999);
          _stateLabel = "认证中";
        }
        break;
      case 1:
        {
          _stateColor = Color(c_23cd77);
          _stateLabel = "已认证";
        }
        break;
      case 2:
        {
          _stateColor = Color(c_ff6600);
          _stateLabel = "认证失败";
        }
        break;
      default:
        {
          _stateColor = Colors.transparent;
          _stateLabel = "";
        }
        break;
    }

    return Container(
      width: double.infinity,
      child: AspectRatio(
        aspectRatio: 4 / 3,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(12))),
          child: Stack(
            children: <Widget>[
              Positioned(
                  child: Container(
                      child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                child: Image.network(carImg),
              ))),
              Visibility(
                visible: isNormalCar,
                child: Positioned(
                    right: 10,
                    top: 10,
                    child: Image.asset(
                      'images/ic_garage_normal_car.png',
                      width: 46,
                      height: 19,
                    )),
              ),
              Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    height: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12)),
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color.fromARGB(0, 0, 0, 0),
                            Color.fromARGB(128, 0, 0, 0),
                          ]),
                    ),
                  )),
              Positioned(
                  bottom: 0,
                  left: 0,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                    child: Row(
                      children: <Widget>[
                        Text(
                          carName + " · " + carPlate,
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 6),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                border: Border.all(
                                  color: _stateColor,
                                  width: 1,
                                )),
                            height: 17,
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 6),
                                child: Text(
                                  _stateLabel,
                                  style: TextStyle(
                                      fontSize: 10,
                                      color: _stateColor,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )),
              Positioned(
                bottom: 0,
                right: 0,
                child: GestureDetector(
                  onTap: callback,
                  child: Container(
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                      child: Image.asset(
                        'images/ic_garage_item_more.png',
                        width: 3,
                        height: 15,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
