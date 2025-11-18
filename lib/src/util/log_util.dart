import "dart:developer" as dev;

class SteveLogUtil {
  const SteveLogUtil._();

  static void info(String message) => _log(.info, message);

  static void warning(String message) => _log(.warning, message);

  static void error(String message) => _log(.error, message);

  static void _log(LogLevel logLevel, String message) => dev.log(message, level: logLevel.level);
}

enum LogLevel {
  info,
  warning,
  error,
}

extension LogLevelValue on LogLevel {
  int get level => switch (this) {
    .info => 800,
    .warning => 900,
    .error => 1000,
  };
}
