import 'package:logger/logger.dart';

class LogDebugger {
  static Logger _logger = Logger();

  static Logger get instance => _logger;
}