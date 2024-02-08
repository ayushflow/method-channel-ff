// Automatic FlutterFlow imports
// Imports other custom actions
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:async';
import 'package:flutter/services.dart';

Future showNativeToast(String value) async {
  try {
    // Create a method channel instance
    const platform = MethodChannel('solutions.flutterflow.io/toast');

    // Trigger the method
    platform.invokeMethod('showToast', value);
  } catch (err, stacktrace) {
    print(err);
    print(stacktrace);
  }
}
