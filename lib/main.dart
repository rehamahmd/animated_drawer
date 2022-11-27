import 'package:animated_drawer/animated_drawer.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animated Drawer',
      theme: ThemeData(
        primaryColor: const Color(0xffb2bec3),
        scaffoldBackgroundColor: const Color.fromARGB(255, 112, 148, 165),
      ),
      home: const Center(child: AnimatedDrawer()),
    );
  }
}
