import 'package:flutter/material.dart';
import 'package:flutter_yourche/widgets/common_color.dart';
import 'package:flutter_yourche/widgets/divider_line.dart';

class ShareBottomDialog {
  BuildContext _context;

  ShareBottomDialog(BuildContext context) {
    this._context = context;
  }

  void show() {
    showModalBottomSheet(
      context: _context,
      builder: (BuildContext context) {
        return Container(
          color: Colors.white,
          width: double.infinity,
          height: 255,
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 16, bottom: 20),
                child: Text(
                  "分享",
                  style: TextStyle(
                      fontSize: 16,
                      color: Color(c_333333),
                      fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _shareTypeItem('images/ic_share_wechat.png', "微信"),
                  _shareTypeItem('images/ic_share_moments.png', "朋友圈"),
                  _shareTypeItem('images/ic_share_weibo.png', "微博"),
                  _shareTypeItem('images/ic_share_qq.png', "QQ"),
                  _shareTypeItem('images/ic_share_qzone.png', "QQ空间"),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              DividerLine(1),
              InkWell(
                onTap: () {
                  //TODO 跳转至举报页面
                  print("举报");
                },
                child: Container(
                  width: double.infinity,
                  height: 48,
                  child: Center(
                    child: Text(
                      "举报",
                      style: TextStyle(
                          fontSize: 16,
                          color: Color(c_333333),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Container(
                height: 10,
                width: double.infinity,
                color: Color(c_f5f5f5),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).maybePop();
                },
                child: Container(
                  height: 48,
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Text(
                    "取消",
                    style: TextStyle(fontSize: 16, color: Color(c_999999)),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  Widget _shareTypeItem(String img, String label) {
    return InkWell(
      onTap: () {
        print(label);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Image.asset(
            img,
            width: 49,
            height: 49,
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Text(
              label,
              style: TextStyle(fontSize: 12, color: Color(c_666666)),
            ),
          ),
        ],
      ),
    );
  }
}
