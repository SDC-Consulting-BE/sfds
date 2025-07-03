import "dart:developer" as dev;

class SteveLogUtil {
  const SteveLogUtil._();

  static void info(String message) => _log(LogLevel.info, message);

  static void warning(String message) => _log(LogLevel.warning, message);

  static void error(String message) => _log(LogLevel.error, message);

  static void _log(LogLevel logLevel, String message) => dev.log(message, level: logLevel.level);
}

enum LogLevel {
  info,
  warning,
  error,
}

extension LogLevelValue on LogLevel {
  int get level => switch (this) {
    LogLevel.info => 800,
    LogLevel.warning => 900,
    LogLevel.error => 1000,
  };
}
