import 'package:flutter/foundation.dart';
import 'dart:developer';

class Log {
  Log(String message) {
    if (kDebugMode && !kReleaseMode) {
      log(message);
    }
  }
}
