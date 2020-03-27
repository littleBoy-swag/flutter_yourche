import 'package:flutter/material.dart';
import 'package:flutter_yourche/page/post_moment_page.dart';
import 'package:flutter_yourche/widgets/common_color.dart';

class PhotoPreViewPage extends StatefulWidget {
  final String imgPath;

  PhotoPreViewPage({@required this.imgPath});

  @override
  _PhotoPreViewPageState createState() => _PhotoPreViewPageState();
}

class _PhotoPreViewPageState extends State<PhotoPreViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Positioned(
            child: Image.asset(widget.imgPath),
          ),
          Positioned(
              bottom: 58,
              left: 0,
              right: 0,
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                      },
                      child: Container(
                        width: 80,
                        height: 44,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color(c_f7d66d),
                              Color(c_fcae26),
                            ],
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(22)),
                        ),
                        child: Center(
                          child: Text(
                            "找车友",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 53,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                          return PostMomentPage();
                        }));
                      },
                      child: Container(
                        width: 80,
                        height: 44,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color(c_ff9e13),
                              Color(c_ff6600),
                            ],
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(22)),
                        ),
                        child: Center(
                          child: Text(
                            "发动态",
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
              ))
        ],
      ),
    );
  }
}
