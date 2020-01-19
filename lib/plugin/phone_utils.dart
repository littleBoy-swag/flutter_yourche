import 'package:flutter/services.dart';

class PhoneUtils {
  static const MethodChannel _channel = const MethodChannel('com.car300.yourcar');

  // 拨打电话
  static void diaCall(String phone) async {
    Map<String, String> args = {"phone_num": phone};
    String result = await _channel.invokeMethod('diaCall', args);
    print("调用原生拨打电话：" + result);
  }



}