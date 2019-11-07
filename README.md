# Flutter Desktop TouchID

TouchID implementation for flutter desktop on macos

## Getting Started

The package requares macos 10.12.2 or newer.

import the package

    import 'package:hive_touch_id/hive_touch_id.dart';

Perform touch ID authentification with provided prompt text

    void touchID() async{
      TouchIDData value = await HiveTouchId.Auth("auth");
      if (value.success){
        print("Authorized");
      } else if (value.touchIDConfigured){
        print("Canceled or Error");
      } else {
        print("Touch Id is not avalible or not configured on the device");
      }
    }



