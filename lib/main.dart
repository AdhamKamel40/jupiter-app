import 'package:flutter/material.dart';
import 'app_theme.dart';
import 'login_screen.dart';

void main() {
  runApp(const JupiterApp());
}

class JupiterApp extends StatelessWidget {
  const JupiterApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jupiter Academy',
      debugShowCheckedModeBanner: false,
      theme: JupiterTheme.themeData,
      home: const LoginScreen(),
    );
  }
}