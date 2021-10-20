import 'package:flutter/material.dart';
import 'package:flutter_project_arch/src/views/ui/welcome.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Welcome(),
    );
  }
}
