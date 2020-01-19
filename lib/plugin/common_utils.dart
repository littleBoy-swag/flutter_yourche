import 'package:flutter/services.dart';

class CommonUtils {
  static const MethodChannel _channel =
      const MethodChannel('com.car300.yourcar');

  //应用评分
  static void rate() async {
    try {
      String result = await _channel.invokeMethod('rate');
      print("调用原生应用评分：" + result);
    } on PlatformException catch (e) {
      print(e);
    }
  }

  //跳转至开启通知页面
  static void go2NotificationSettings() async {
    try {
      await _channel.invokeMethod('go2NotificationSettings');
    } on PlatformException catch (e) {
      print(e);
    }
  }

  static Future<bool> isNotificationEnable() async {
    try {
      bool result = await _channel.invokeMethod('isNotificationEnable');
      return result;
    } on PlatformException catch (e) {
      print(e);
    }
    return false;
  }

}
