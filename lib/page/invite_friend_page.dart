import 'package:easy_contact_picker/easy_contact_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_yourche/widgets/appbar.dart';
import 'package:flutter_yourche/widgets/common_color.dart';
import 'package:flutter_yourche/widgets/divider_line.dart';
import 'package:flutter_yourche/widgets/my_check_box.dart';
import 'package:flutter_yourche/widgets/toast.dart';
import 'package:permission_handler/permission_handler.dart';

class InviteFriendPage extends StatefulWidget {
  @override
  _InviteFriendPageState createState() => _InviteFriendPageState();
}

class _InviteFriendPageState extends State<InviteFriendPage> {
  int _selectNum = 0;
  List<String> _letters = List();
  GlobalKey _key = GlobalKey();
  ScrollController _controller = ScrollController();

  List<Contact> _contacts = List();
  List<bool> _checkList = List();
  final EasyContactPicker _picker = EasyContactPicker();

  @override
  void initState() {
    super.initState();
    _reqPermission();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appbar(context, "邀请好友"),
      body: Stack(
        children: <Widget>[
          Positioned(
            bottom: 48,
            left: 0,
            top: 0,
            right: 0,
            child: _contactList(),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(
                  color: Color(c_f0f0f0),
                )),
              ),
              height: 48,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      child: Padding(
                        padding: EdgeInsets.only(left: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "已选$_selectNum人",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Color(c_333333),
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Text(
                              "邀请将以免费短信发出",
                              style: TextStyle(
                                  fontSize: 12, color: Color(c_ff6600)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                      child: InkWell(
                    onTap: () {
                      Toast.show(context, "已邀请");
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          Color(c_ff6600),
                          Color(c_ff9e13),
                        ]),
                      ),
                      child: Center(
                        child: Text(
                          "立即邀请",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _contactList() {
    return Container(
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
              child: ListView.separated(
            controller: _controller,
            physics: BouncingScrollPhysics(),
            separatorBuilder: (context, index) {
              return DividerLine(1);
            },
            itemBuilder: (context, index) {
              return Column(
                children: <Widget>[
                  Visibility(
                    child: Container(
                      color: Color(c_f5f5f5),
                      width: double.infinity,
                      height: 30,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            _contacts[index].firstLetter,
                            style:
                                TextStyle(fontSize: 16, color: Color(c_333333)),
                          ),
                        ),
                      ),
                    ),
                    visible: (index == 0 ||
                        _contacts[index].firstLetter !=
                            _contacts[index - 1].firstLetter),
                  ),
                  ListTile(
                    onTap: () {
                      _checkList[index] = !_checkList[index];
                      _selectNum = 0;
                      for (var i = 0; i < _checkList.length; i++) {
                        if (_checkList[i]) {
                          _selectNum++;
                        }
                      }
                      setState(() {});
                    },
                    leading: MyCheckBox(
                      value: _checkList[index],
                    ),
                    title: Text(
                      "${_contacts[index].fullName}",
                      style: TextStyle(color: Color(c_333333), fontSize: 16),
                    ),
                  )
                ],
              );
            },
            itemCount: _contacts.length,
          )),
          Positioned(
            right: 0,
            child: Padding(
              padding: EdgeInsets.only(right: 4),
              child: Container(
                decoration: BoxDecoration(
                  color: Color(c_f0f0f0),
                  borderRadius: BorderRadius.all(Radius.circular(2)),
                ),
                width: 24,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: GestureDetector(
                    onVerticalDragDown: (details) {
                      _go2Item(details.globalPosition);
                    },
                    onVerticalDragUpdate: (details) {
                      _go2Item(details.globalPosition);
                    },
                    onVerticalDragEnd: (details) {
                      print("onVerticalDragEnd");
                    },
                    child: Column(
                      key: _key,
                      mainAxisSize: MainAxisSize.min,
                      children: _getLetters(),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _go2Item(Offset dragOffset) {
    RenderBox _box = _key.currentContext.findRenderObject();
    Offset _offset = _box.localToGlobal(Offset.zero);
    print(_offset.dy);
    print(dragOffset.dy);
    double gap = dragOffset.dy - _offset.dy;
    int index = gap ~/ 12;
    print(index);
    String letter = _letters[index];
    print(letter);
    for (int i = 0; i < _contacts.length; i++) {
      if (_contacts[i].firstLetter == letter) {
        print(i);
        double offset = (index * 30.0 + i * 48.0);
        _controller.animateTo(offset,
            duration: Duration(milliseconds: 500), curve: Curves.ease);
        break;
      }
    }
  }

  List<Widget> _getLetters() {
    return _letters.map((v) {
      return Container(
        width: 24,
        height: 12,
        child: Center(
          child: Text(
            v,
            style: TextStyle(fontSize: 12, color: Color(c_333333)),
          ),
        ),
      );
    }).toList();
  }

  void _reqPermission() async {
    // 申请权限
    Map<PermissionGroup, PermissionStatus> permissions =
        await PermissionHandler()
            .requestPermissions([PermissionGroup.contacts]);
    PermissionStatus permission = await PermissionHandler()
        .checkPermissionStatus(PermissionGroup.contacts);
    if (permission == PermissionStatus.granted) {
      _getContacts();
    }
  }

  void _getContacts() async {
    List<Contact> _list = await _picker.selectContacts();
    for (var i = 0; i < _list.length; i++) {
      _checkList.add(false);
      if (!_letters.contains(_list[i].firstLetter)) {
        _letters.add(_list[i].firstLetter);
      }
      _letters.sort((l, r) => l.compareTo(r));
    }
    setState(() {
      _contacts = _list;
    });
  }
}
