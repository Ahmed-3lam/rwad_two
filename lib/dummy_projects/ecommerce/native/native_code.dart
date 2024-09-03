import 'package:flutter/services.dart';

class NativeBridge {
  static const MethodChannel _channel = MethodChannel('rwad2');
  static Future<String> getComplexData() async {
    final String result = await _channel.invokeMethod('getNativeData');
    print("================" + result);
    return result;
  }
}
