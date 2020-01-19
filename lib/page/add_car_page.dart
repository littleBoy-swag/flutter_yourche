import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_yourche/page/car_pick_page.dart';
import 'package:flutter_yourche/widgets/action_sheet/action_sheet.dart';
import 'package:flutter_yourche/widgets/action_sheet/action_sheet_item.dart';
import 'package:flutter_yourche/widgets/add_car_widget.dart';
import 'package:flutter_yourche/widgets/appbar.dart';
import 'package:flutter_yourche/widgets/common_color.dart';
import 'package:flutter_yourche/widgets/common_strings.dart';
import 'package:flutter_yourche/widgets/dialog_widgets.dart';
import 'package:flutter_yourche/widgets/divider_line.dart';

class AddCarPage extends StatefulWidget {
  @override
  _AddCarPageState createState() => _AddCarPageState();
}

class _AddCarPageState extends State<AddCarPage> {
  String _carName = "请选择车型";
  String _driveLicenseUrl = "";
  String _carPicUrl = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appbar(context, "我的车库"),
      body: CustomScrollView(
        shrinkWrap: true,
        slivers: <Widget>[
          SliverPadding(
            padding: EdgeInsets.only(top: 16),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 16, right: 16),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        AddCarWidget(
                          callback: () {
                            ActionSheet(context)
                                .addItem(ActionSheetItem(
                                  label: "拍照",
                                  callback: () {
                                    print("拍照");
                                  },
                                ))
                                .addItem(ActionSheetItem(
                                  label: "从相册选择",
                                  callback: () {
                                    print("从相册选择");
                                  },
                                ))
                                .show();
                          },
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 25, bottom: 10),
                          child: Text(
                            "车辆信息",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                                color: Color(c_333333)),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (_) {
                              return CarPickPage();
                            }));
                          },
                          child: Container(
                            width: double.infinity,
                            height: 48,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  child: Text(
                                    "车系",
                                    style: TextStyle(
                                        fontSize: 16, color: Color(c_333333)),
                                  ),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Text(
                                      _carName,
                                      style: TextStyle(
                                          fontSize: 16, color: Color(c_333333)),
                                    ),
                                    SizedBox(
                                      width: 16,
                                    ),
                                    Image.asset(
                                      'images/ic_arrow_forward.png',
                                      width: 6,
                                      height: 9,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        DividerLine(1),
                        InkWell(
                          onTap: () {
                            ActionSheet(context)
                                .addItem(ActionSheetItem(
                                  label: "拍照",
                                  callback: () {
                                    print("拍照");
                                  },
                                ))
                                .addItem(ActionSheetItem(
                                  label: "从相册选择",
                                  callback: () {
                                    print("从相册选择");
                                  },
                                ))
                                .show();
                          },
                          child: Container(
                            width: double.infinity,
                            height: 48,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  child: Text(
                                    "添加行驶证",
                                    style: TextStyle(
                                        fontSize: 16, color: Color(c_333333)),
                                  ),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    _driveLicenseUrl.isEmpty
                                        ? Container(
                                            decoration: BoxDecoration(
                                              color: Color(c_f5f5f5),
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                            width: 92,
                                            height: 30,
                                            child: Center(
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: <Widget>[
                                                  Image.asset(
                                                    'images/ic_add_car_upload.png',
                                                    width: 14,
                                                    height: 13,
                                                  ),
                                                  SizedBox(
                                                    width: 4,
                                                  ),
                                                  Text(
                                                    "上传证件",
                                                    style: TextStyle(
                                                        fontSize: 13,
                                                        color: Color(c_999999)),
                                                  )
                                                ],
                                              ),
                                            ),
                                          )
                                        : Image.asset(
                                            'images/logo.png',
                                            width: 40,
                                            height: 30,
                                          ),
                                    SizedBox(
                                      width: 16,
                                    ),
                                    Image.asset(
                                      'images/ic_arrow_forward.png',
                                      width: 6,
                                      height: 9,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        DividerLine(1),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                  DividerLine(10),
                  Padding(
                    padding: EdgeInsets.only(top: 20, bottom: 16, left: 16),
                    child: Text(
                      "注意事项",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: Color(c_333333)),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 20, left: 16, right: 16),
                    //给text设置行间距通过调整height的大小，但不太好，先这样
                    child: Transform.translate(
                      offset: Offset(0, 7),
                      child: Text(
                        add_car_tip,
                        strutStyle: StrutStyle(
                            forceStrutHeight: true, height: 0.5, leading: 0.9),
                        style: TextStyle(
                          fontSize: 15,
                          color: Color(c_666666),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      showDialogWithTitle(context, "提示", "提交后如需修改需要重新进行认证，请您核对无误后点击“确定”进行提交。", (){
                        //TODO cancel
                      }, (){
                        //TODO confirm
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(c_ff6600),
                            Color(c_ff9e13),
                          ],
                        ),
                      ),
                      width: double.infinity,
                      height: 48,
                      child: Center(
                        child: Text(
                          "去认证",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
