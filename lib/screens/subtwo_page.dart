import 'package:flutter/material.dart';

class SubtwoPage extends StatefulWidget {
  const SubtwoPage({super.key});

  @override
  State<SubtwoPage> createState() => _SubtwoPageState();
}

class _SubtwoPageState extends State<SubtwoPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text('subpage two'),
    );
  }
}
