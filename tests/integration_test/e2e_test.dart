import 'dart:io';

import 'package:firebase_core_desktop/firebase_core_desktop.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'firebase_auth/firebase_auth_e2e_test.dart' as firebase_auth;
import 'firebase_core/firebase_core_e2e_test.dart' as firebase_core;
import 'cloud_functions/cloud_functions_e2e_test.dart' as cloud_functions;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  if (Platform.isWindows) {
    // Use firebase_core_desktop plugin on Windows instead of the official
    forceRegisterFirebaseCoreDesktopPlugin();
  }

  group('FlutterFire', () {
    firebase_core.main();
    firebase_auth.main();
    cloud_functions.main();
  });
}
