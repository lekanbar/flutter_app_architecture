import 'package:flutter/material.dart';
import 'package:flutter_app_architecture/architecture_app.dart';
import 'package:logging/logging.dart';

void main() {
  Logger.root.level = Level.INFO;
  Logger.root.onRecord.listen((LogRecord rec) {
    //Log to console
    print('${rec.level.name}: ${rec.time}: ${rec.message}');

    //You can pass logs to anywhere else like file, email or API
  });

  runApp(ArchitectureApp());
}
