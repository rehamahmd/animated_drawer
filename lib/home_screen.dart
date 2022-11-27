import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final Function menuAction;
  const HomeScreen({super.key, required this.menuAction});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  _toggleMenu() => widget.menuAction();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 2.0,
        backgroundColor: Color(0xffb2bec3),
        title: GestureDetector(
          onTap: _toggleMenu,
          child: const Icon(Icons.menu),
        ),
      ),
      body: ListView(
        children: <Color>[
          Colors.grey.withOpacity(.4),
          Colors.grey.withOpacity(.4),
          Colors.grey.withOpacity(.4),
          Colors.grey.withOpacity(.4),
          Colors.grey.withOpacity(.4),
          Colors.grey.withOpacity(.4),
          Colors.grey.withOpacity(.4),
        ]
            .map((e) => Container(
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  color: e,
                  margin: const EdgeInsets.all(10),
                ))
            .toList(),
      ),
    );
  }
}
