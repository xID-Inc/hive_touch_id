import 'dart:async';

import 'package:flutter/services.dart';

class TouchIDData {
  /// Return true if a device can use touch ID authentification
  bool touchIDConfigured;
  /// Return true if an authentification was successful
  bool success;

  TouchIDData(this.touchIDConfigured, this.success);
}

class HiveTouchId {
  static const MethodChannel _channel = const MethodChannel('hive_touch_id');

/// Perform touch ID authentification with provided prompt text
  static Future<TouchIDData> Auth(String promptText) async {
    final Map auth = await _channel.invokeMethod('getTouchID', promptText);
    TouchIDData touchIDData;
    if (auth["success"] != null || auth["success"] == true) {
      touchIDData = TouchIDData(true, true);
    } else if (auth["failed"] != null || auth["failed"] == true) {
      touchIDData = TouchIDData(true, false);
    } else if (auth["notConfigured"] != null || auth["notConfigured"] == true) {
      touchIDData = TouchIDData(false, false);
    }
    return touchIDData;
  }
}
