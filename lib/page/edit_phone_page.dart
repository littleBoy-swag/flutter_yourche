import 'package:flutter/material.dart';
import 'package:flutter_yourche/widgets/appbar.dart';
import 'package:flutter_yourche/widgets/common_button.dart';
import 'package:flutter_yourche/widgets/common_color.dart';
import 'package:flutter_yourche/widgets/common_text_style.dart';
import 'package:flutter_yourche/widgets/divider_line.dart';

class EditPhonePage extends StatefulWidget {
  @override
  _EditPhonePageState createState() => _EditPhonePageState();
}

class _EditPhonePageState extends State<EditPhonePage> {
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _codeController = TextEditingController();

  String _phone = "";
  String _code = "";
  bool _requestEnable = false;

  BoxDecoration _enableDecoration = BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Color(c_ff6600),
          Color(c_ff9e13),
        ],
      ),
      borderRadius: BorderRadius.circular(24));

  BoxDecoration _unableDecoration = BoxDecoration(
      color: Color(c_cccccc), borderRadius: BorderRadius.circular(24));

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(c_f5f5f5),
      appBar: appbar(context, "修改手机号码"),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding:
                        EdgeInsets.only(top: 5, bottom: 5, left: 16, right: 16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          'images/ic_edit_phone_num.png',
                          width: 18,
                          height: 18,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: TextField(
                            onChanged: (val) {
                              _phone = val;
                              _checkState();
                            },
                            maxLines: 1,
                            maxLength: 11,
                            enableInteractiveSelection: false,
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            controller: _phoneController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.all(0),
                              hintText: "请输入手机号",
                              counterText: "",
                              suffix: IconButton(
                                icon: Icon(
                                  Icons.cancel,
                                  color: Colors.grey[300],
                                ),
                                iconSize: 18,
                                onPressed: () {
                                  _phoneController.clear();
                                  _phone = "";
                                  _checkState();
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  DividerLine(1),
                  Padding(
                    padding:
                        EdgeInsets.only(top: 5, bottom: 5, left: 16, right: 16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          'images/ic_edit_phone_code.png',
                          width: 18,
                          height: 18,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: TextField(
                            onChanged: (val) {
                              _code = val;
                              _checkState();
                            },
                            maxLines: 1,
                            maxLength: 6,
                            enableInteractiveSelection: false,
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            controller: _codeController,
                            decoration: InputDecoration(
                              fillColor: Colors.blueAccent,
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.all(0),
                              hintText: "请输入验证码",
                              counterText: "",
                              suffix: IconButton(
                                icon: Icon(
                                  Icons.cancel,
                                  color: Colors.grey[300],
                                ),
                                iconSize: 18,
                                onPressed: () {
                                  _codeController.clear();
                                  _code = "";
                                  _checkState();
                                },
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            //简单判断手机号是否正确
                            if (_phone.length == 11 && _phone.startsWith("1")) {
                              //TODO 请求获取验证码
                              print("请求获取验证码");
                            } else {
                              //TODO TOAST
                              print("请输入正确的手机号");
                            }
                          },
                          child: Text(
                            "获取验证码",
                            style:
                                TextStyle(fontSize: 15, color: Color(c_ff6600)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 40, left: 16, right: 16),
              child: GestureDetector(
                onTap: () {
                  if (_requestEnable) {
                    _requestSubmit();
                  }
                },
                child: Container(
                  height: 48,
                  decoration:
                      _requestEnable ? _enableDecoration : _unableDecoration,
                  child: Center(
                    child: Text(
                      "提交",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 18),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _checkState() {
    if (_phone.length == 11 && _code.length == 6) {
      _requestEnable = true;
      setState(() {});
    } else {
      _requestEnable = false;
      setState(() {});
    }
  }

  void _requestSubmit() {
    //TODO 提交修改手机号请求
    print("提交修改手机号请求");
  }
}
