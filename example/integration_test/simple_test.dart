import 'package:integration_test/integration_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:zxcvbn_rust_to_dart/zxcvbn_rust_to_dart.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    await RustLib.init();
  });

  test('Can call rust function', () async {
    final weak = await estimatePasswordStrength(password: "password123");
    final strong = await estimatePasswordStrength(password: "Tr0ub4dor&3");
    final empty = await estimatePasswordStrength(password: "");

    expect(weak, 0.0);
    expect(strong, 4.0);
    expect(empty, 0.0);
  });
}
