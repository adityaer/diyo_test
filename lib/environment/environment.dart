import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String flavorName = '';

  static String get fileName {
    if (flavorName == 'develop') {
      return '.env';
    } else if (flavorName == 'staging') {
      return '.env.staging';
    } else {
      return '.env.production';
    }
  }

  static String get baseUrl {
    return dotenv.env['BASE_URL'] ?? 'BASE_URL not found';
  }
}
