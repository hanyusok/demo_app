import 'package:flutter/material.dart';

class SubthreePage extends StatefulWidget {
  const SubthreePage({super.key});

  @override
  State<SubthreePage> createState() => _SubthreePageState();
}

class _SubthreePageState extends State<SubthreePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text('subthree page'),
    );
  }
}
