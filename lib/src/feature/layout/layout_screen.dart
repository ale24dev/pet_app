import 'package:flutter/material.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
       leading: const Icon(Icons.menu),
      ),
      body: const Column(
        children: [
          Text('Home Screen')
        ],
      ),
    );
  }
}