import 'package:flutter/material.dart';

import 'core/pages/app.dart';
import 'di/injection.dart';

void main() {
  Locator().init();
  runApp(const App());
}
