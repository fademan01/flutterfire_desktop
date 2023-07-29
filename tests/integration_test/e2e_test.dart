import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'firebase_auth/firebase_auth_e2e_test.dart' as firebase_auth;
import 'firebase_core/firebase_core_e2e_test.dart' as firebase_core;
import 'firebase_functions/firebase_functions_e2e_test.dart'
    as firebase_functions;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('FlutterFire', () {
    firebase_core.main();
    firebase_auth.main();
    firebase_functions.main();
  });
}
