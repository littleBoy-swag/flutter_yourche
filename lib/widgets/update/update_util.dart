import 'package:flutter/material.dart';
import 'package:flutter_yourche/widgets/common_color.dart';

class UpdateUtil {
  static checkUpdate(BuildContext context) {
    //TODO 接口调用来检测是否需要更新
    _showUpdateDialog(context);
  }

  static _showUpdateDialog(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return StatefulBuilder(
            builder: (context, state) {
              return _UpdateDialog();
            },
          );
        });
  }
}

class _UpdateDialog extends Dialog {
  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: SizedBox(
          width: 290,
          height: 375,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(8))),
            child: Column(
              children: <Widget>[
                Image.asset(
                  'images/ic_update_header.png',
                  width: double.infinity,
                  height: 140,
                ),
                Container(
                  width: double.infinity,
                  height: 162,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 14, left: 25),
                        child: Text(
                          "更新内容",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Color(c_333333)),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                        child: Container(
                          height: 84,
                          width: double.infinity,
                          child: CustomScrollView(
                            slivers: <Widget>[
                              SliverToBoxAdapter(
                                child: Text(
                                  "1.车架号支持拍照识别\n2.车辆检测优化\n3.车辆检测报告显示优化\n4.还没想好",
                                  style: TextStyle(
                                      fontSize: 16, color: Color(c_666666)),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 12),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).maybePop();
                    },
                    child: Container(
                      height: 48,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(24)),
                        gradient: LinearGradient(colors: [
                          Color(c_ff6600),
                          Color(c_ff9e13),
                        ]),
                      ),
                      child: Center(
                        child: Text(
                          "立即更新",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
