import 'package:flutter/foundation.dart';
import 'package:talker_flutter/talker_flutter.dart';

abstract class Logger {
  static final Talker talker = TalkerFlutter.init(
    logger: TalkerLogger(
      settings: TalkerLoggerSettings(
        maxLineWidth: 80,
        enableColors: false,
      ),
    ),
    settings: TalkerSettings(
      useHistory: true,
      maxHistoryItems: 1000,
      useConsoleLogs: kDebugMode,
    ),
  );

  /// Log debug
  static void d(dynamic msg, [Object? error, StackTrace? stackTrace]) {
    talker.debug(msg, error, stackTrace);
  }

  /// Log Ads
  static void ads(dynamic msg, [Object? error, StackTrace? stackTrace]) {
    talker.debug("📺 $msg", error, stackTrace);
  }

  /// Log error
  static void e(dynamic msg, [Object? error, StackTrace? stackTrace]) {
    talker.error(msg, error, stackTrace);
  }

  /// Log warning
  static void w(dynamic msg, [Object? error, StackTrace? stackTrace]) {
    talker.warning(msg, error, stackTrace);
  }

  /// Log info
  static void i(dynamic msg, [Object? error, StackTrace? stackTrace]) {
    talker.info(msg, error, stackTrace);
  }

  /// Log verbose
  static void v(dynamic msg, [Object? error, StackTrace? stackTrace]) {
    talker.verbose(msg, error, stackTrace);
  }
}
