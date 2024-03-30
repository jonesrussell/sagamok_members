import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'src/app.dart';
import 'src/settings/settings_controller.dart';
import 'src/settings/settings_service.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load(); // Load environment variables

  await Firebase.initializeApp();

  final settingsController = SettingsController(SettingsService());
  await settingsController.loadSettings();
  runApp(MyApp(settingsController: settingsController));
}
