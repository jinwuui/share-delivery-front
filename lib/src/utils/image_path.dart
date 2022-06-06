import 'package:flutter_dotenv/flutter_dotenv.dart';

String imagePathWithHost(String path) {
  return "${dotenv.get("SERVER_HOST")}$path";
}
