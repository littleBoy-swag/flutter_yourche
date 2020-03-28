import 'package:flutter/material.dart';
import 'package:flutter_yourche/widgets/common_color.dart';

import 'VoteWidget.dart';

class MomentItemWidget extends StatefulWidget {
  final bool voteChecked;
  final bool unvoteChecked;

  MomentItemWidget({@required this.voteChecked, @required this.unvoteChecked});

  @override
  _MomentItemWidgetState createState() => _MomentItemWidgetState();
}

class _MomentItemWidgetState extends State<MomentItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 12, bottom: 12, left: 16, right: 16),
            child: Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  ClipOval(
                    child: Image.asset(
                      'images/ic_default_avatar.png',
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
                            "梦比糖果甜",
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
                                  color: true
                                      ? Color(c_86cdff)
                                      : Color(c_ff9bc6),
                                  borderRadius: BorderRadius.circular(9)),
                              child: Center(
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Image.asset(
                                      true
                                          ? 'images/ic_gender_male.png'
                                          : 'images/ic_gender_female.png',
                                      width: 9,
                                      height: 9,
                                    ),
                                    SizedBox(
                                      width: 4,
                                    ),
                                    Text(
                                      "24",
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
                        "本田SUV · 苏A****1",
                        style: TextStyle(fontSize: 12, color: Color(c_b2b2b2)),
                      ),
                    ],
                  ),
                  Expanded(
                    child: SizedBox(
                      width: 1,
                    ),
                  ),
                  GestureDetector(
                    onTap: (){},
                    child: Container(
                      height: 26,
                      width: 42,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13),
                          border: Border.all(
                              width: 1,
                              color: Color(c_ff6600),
                              style: BorderStyle.solid)),
                      child: Center(
                        child: Text(
                          "吆~",
                          style: TextStyle(fontSize: 12, color: Color(c_ff6600)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "你好呀",
              style: TextStyle(fontSize: 15, color: Color(c_333333)),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Container(
              constraints: BoxConstraints(maxHeight: 300),
              width: 240,
              child: Image.network(
                  "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1580567149864&di=9955b16ad2a7bc9a42505c688e5a31ed&imgtype=0&src=http%3A%2F%2Fimage.geni4s.com%2Fcar_photo%2F20110310%2F20110310164421_01162177.jpg"),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              decoration: BoxDecoration(
                color: Color(c_f5f5f5),
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              height: 24,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 14),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(right: 4),
                      child: Image.asset(
                        'images/ic_moment_loc.png',
                        width: 9,
                        height: 11,
                      ),
                    ),
                    Text(
                      "北京 · 朝阳大悦城购物中心",
                      style: TextStyle(fontSize: 11, color: Color(c_7f91ae)),
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Text(
              "5分钟前 · 100m",
              style: TextStyle(fontSize: 11, color: Color(c_7f91ae)),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 20, left: 16, right: 16, top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                VoteWidget(
                  checked: widget.voteChecked,
                  checkedImg: 'images/ic_voted.png',
                  uncheckedImg: 'images/ic_vote.png',
                  content: "134",
                  callback: () {},
                ),
                VoteWidget(
                  checked: widget.unvoteChecked,
                  checkedImg: 'images/ic_unvoted.png',
                  uncheckedImg: 'images/ic_unvote.png',
                  content: "134",
                  callback: () {},
                ),
                VoteWidget(
                  checked: false,
                  checkedImg: 'images/ic_comment.png',
                  uncheckedImg: 'images/ic_comment.png',
                  content: "56",
                  callback: () {},
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
