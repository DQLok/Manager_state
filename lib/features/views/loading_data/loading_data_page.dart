import 'package:flutter/material.dart';

class LoadingDataPage extends StatefulWidget {
  const LoadingDataPage({super.key});

  @override
  State<LoadingDataPage> createState() => _LoadingDataPageState();
}

class _LoadingDataPageState extends State<LoadingDataPage> {
  @override
  void initState() {
    super.initState();
    if (mounted) {
      Future.delayed(const Duration(seconds: 3), () {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
