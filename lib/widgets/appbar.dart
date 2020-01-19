import 'dart:ui';
import 'package:flutter/material.dart';

againstStatusBarView() {
  return PreferredSize(
    preferredSize:
        Size.fromHeight(MediaQueryData.fromWindow(window).padding.top),
    child: SafeArea(
      top: true,
      child: Container(
        height: 0,
      ),
    ),
  );
}

appbar(BuildContext context, String title) {
  return PreferredSize(
      preferredSize: Size.fromHeight(48),
      child: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
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
        title: Text(
          title,
          style: TextStyle(fontSize: 18, color: Color(0xFF000000)),
        ),
        centerTitle: true,
      ));
}
