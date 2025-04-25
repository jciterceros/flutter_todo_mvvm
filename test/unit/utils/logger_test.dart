import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_todo_mvvm/utils/logger.dart';

void main() {
  group('Logger', () {
    test('logInfo should log info messages', () {
      expect(() => Logger.logInfo('This is an info message'), returnsNormally);
    });

    test('logError should log error messages without error object', () {
      expect(
        () => Logger.logError('This is an error message'),
        returnsNormally,
      );
    });

    test('logError should log error messages with error object', () {
      expect(
        () => Logger.logError(
          'This is an error message',
          Exception('Test exception'),
        ),
        returnsNormally,
      );
    });

    test('logDebug should log debug messages', () {
      expect(() => Logger.logDebug('This is a debug message'), returnsNormally);
    });
  });
}
