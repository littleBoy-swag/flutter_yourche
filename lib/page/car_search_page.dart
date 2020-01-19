import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_yourche/widgets/common_color.dart';

class CarSearchPage extends StatefulWidget {
  @override
  _CarSearchPageState createState() => _CarSearchPageState();
}

class _CarSearchPageState extends State<CarSearchPage> {
  TextEditingController _searchKeyController = TextEditingController();
  String _searchKey = "";
  bool _hideHistoryTitle = false;
  bool _hideHistoryContent = false;
  bool _hideHotTitle = false;
  bool _hideHotContent = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        title: Padding(
          padding: EdgeInsets.only(right: 16),
          child: Container(
            height: 34,
            decoration: BoxDecoration(
                color: Color(c_f5f5f5),
                borderRadius: BorderRadius.circular(17)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: 16,
                ),
                Image.asset(
                  'images/ic_search.png',
                  width: 16,
                  height: 16,
                ),
                SizedBox(
                  width: 7,
                ),
                Expanded(
                  child: TextField(
                    controller: _searchKeyController,
                    style: TextStyle(fontSize: 15, color: Color(c_333333)),
                    maxLines: 1,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(top: -2),
                      border: InputBorder.none,
                      hintText: "请输入车系或品牌",
                      hintStyle:
                          TextStyle(fontSize: 15, color: Color(c_cccccc)),
                    ),
                    onChanged: (val) {
                      _searchKey = val;
                      _requestSearch();
                    },
                  ),
                ),
              ],
            ),
          ),
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
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 20, left: 16, right: 16),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Offstage(
                offstage: _hideHistoryTitle,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "搜索历史",
                      style: TextStyle(
                          fontSize: 17,
                          color: Color(c_333333),
                          fontWeight: FontWeight.bold),
                    ),
                    InkWell(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Image.asset(
                            'images/ic_history_delete.png',
                            width: 15,
                            height: 15,
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Text(
                            "清空历史",
                            style:
                                TextStyle(fontSize: 15, color: Color(c_666666)),
                          )
                        ],
                      ),
                      onTap: () {
                        //TODO 清空历史
                        _hideHistoryTitle = true;
                        _hideHistoryContent = true;
                        setState(() {});
                      },
                    ),
                  ],
                ),
              ),
              Offstage(
                offstage: _hideHistoryContent,
                child: Padding(
                  padding: EdgeInsets.only(top: 15, bottom: 30),
                  child: Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: <Widget>[
                      _brandItem("比速T5"),
                      _brandItem("大众"),
                      _brandItem("雪佛兰"),
                      _brandItem("阿斯顿马丁"),
                      _brandItem("路虎揽胜"),
                    ],
                  ),
                ),
              ),
              Offstage(
                offstage: _hideHotTitle,
                child: Text(
                  "热门搜索",
                  style: TextStyle(
                      fontSize: 17,
                      color: Color(c_333333),
                      fontWeight: FontWeight.bold),
                ),
              ),
              Offstage(
                offstage: _hideHotContent,
                child: Padding(
                  padding: EdgeInsets.only(top: 15, bottom: 30),
                  child: Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: <Widget>[
                      _brandItem("比速T5"),
                      _brandItem("大众"),
                      _brandItem("雪佛兰"),
                      _brandItem("阿斯顿马丁"),
                      _brandItem("勒布朗·詹姆斯"),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _requestSearch() {
    //TODO 请求搜索车系和品牌
  }

  Widget _brandItem(String text) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Container(
        height: 28,
        decoration: BoxDecoration(
          color: Color(c_f5f5f5),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 12, right: 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                text,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 14, color: Color(c_666666)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
