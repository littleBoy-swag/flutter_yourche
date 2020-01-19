import 'package:flutter/material.dart';
import 'package:flutter_yourche/page/edit_profile_page.dart';
import 'package:flutter_yourche/widgets/common_color.dart';

class OwnerMainPage extends StatefulWidget {
  @override
  _OwnerMainPageState createState() => _OwnerMainPageState();
}

class _OwnerMainPageState extends State<OwnerMainPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              backgroundColor: Colors.white,
              primary: true,
              forceElevated: true,
              automaticallyImplyLeading: true,
              snap: false,
              expandedHeight: 275,
              floating: false,
              pinned: true,
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
              actions: <Widget>[
                Padding(
                  padding: EdgeInsets.only(right: 16),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (_) {
                        return EditProfilePage();
                      }), (route) => route == null);
                    },
                    child: Center(
                      child: Text(
                        "一键登录",
                        style: TextStyle(color: Color(c_666666), fontSize: 14),
                      ),
                    ),
                  ),
                ),
              ],
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                  'images/ic_bg_main_page.png',
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ];
        },
        body: ListView(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 200,
              color: Colors.blueAccent,
            ),
            Container(
              width: double.infinity,
              height: 300,
              color: Colors.redAccent,
            ),
            Container(
              width: double.infinity,
              height: 200,
              color: Colors.blueAccent,
            ),
            Container(
              width: double.infinity,
              height: 300,
              color: Colors.redAccent,
            ),
            Container(
              width: double.infinity,
              height: 200,
              color: Colors.blueAccent,
            ),
            Container(
              width: double.infinity,
              height: 300,
              color: Colors.redAccent,
            ),
          ],
        ),
      ),
    );
  }
}
