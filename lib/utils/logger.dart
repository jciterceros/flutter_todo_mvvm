import 'dart:developer';

class Logger {
  static void logInfo(String message) {
    log('[INFO]: $message');
  }

  static void logError(String message, [Object? error]) {
    log('[ERROR]: $message', error: error);
  }

  static void logDebug(String message) {
    log('[DEBUG]: $message');
  }
}
