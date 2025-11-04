import 'package:flutter/material.dart';
import 'package:zxcvbn_rust_to_dart/zxcvbn_rust_to_dart.dart';

Future<void> main() async {
  await RustLib.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('flutter_rust_bridge quickstart')),
        body: Center(
          child: TextField(
            onChanged: (value) {
              estimatePasswordStrength(password: value).then((strength) {
                debugPrint('Password strength: $strength');
              });
            },
          ),
        ),
      ),
    );
  }
}
