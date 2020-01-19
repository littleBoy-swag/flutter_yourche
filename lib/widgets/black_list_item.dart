import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_yourche/widgets/common_color.dart';

class BlackListItemWidget extends StatelessWidget {
  final String avatar;
  final String name;
  final String age;
  final String gender;
  final String blackTime;
  final VoidCallback callback;

  BlackListItemWidget(
      {@required this.avatar,
      @required this.name,
      @required this.age,
      @required this.gender,
      @required this.blackTime,
      @required this.callback});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 12, bottom: 12, left: 16, right: 16),
      child: Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ClipOval(
              child: Image.asset(
                avatar,
                width: 44,
                height: 44,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Text(
                      name,
                      style: TextStyle(
                          fontSize: 16,
                          color: Color(c_333333),
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Container(
                        width: 34,
                        height: 17,
                        decoration: BoxDecoration(
                            color: gender == "1"
                                ? Color(c_86cdff)
                                : Color(c_ff9bc6),
                            borderRadius: BorderRadius.circular(9)),
                        child: Center(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Image.asset(
                                gender == "1"
                                    ? 'images/ic_gender_male.png'
                                    : 'images/ic_gender_female.png',
                                width: 9,
                                height: 9,
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Text(
                                age,
                                style: TextStyle(
                                    fontSize: 11, color: Colors.white),
                              ),
                            ],
                          ),
                        )),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "拉黑时间：" + blackTime,
                  style: TextStyle(fontSize: 12, color: Color(c_999999)),
                ),
              ],
            ),
            Expanded(
              child: SizedBox(
                width: 1,
              ),
            ),
            GestureDetector(
              onTap: callback,
              child: Container(
                height: 26,
                width: 67,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13),
                    border: Border.all(
                        width: 1,
                        color: Color(c_333333),
                        style: BorderStyle.solid)),
                child: Center(
                  child: Text(
                    "解除拉黑",
                    style: TextStyle(fontSize: 12, color: Color(c_333333)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}
