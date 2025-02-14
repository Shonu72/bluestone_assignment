import 'package:logger/logger.dart';

class Helpers {
  static var logger = Logger(
      printer: PrettyPrinter(
    methodCount: 2,
    errorMethodCount: 8,
    lineLength: 50,
    colors: true,
    printEmojis: true,
  ));
}
