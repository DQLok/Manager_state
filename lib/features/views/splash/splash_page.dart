import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    if (mounted) {
      Future.delayed(const Duration(seconds: 1), () {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Icon(Icons.flutter_dash)));
  }
}
