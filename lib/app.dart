import 'package:flutter/material.dart';
import 'package:cross/widgets/cross_app_bar.dart';
import 'package:cross/widgets/task.dart';

class Cross extends StatelessWidget {
  const Cross({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CrossAppBar(),
      body: Task()
    );
  }
}
