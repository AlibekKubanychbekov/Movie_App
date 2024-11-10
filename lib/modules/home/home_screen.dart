import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home screen'),
      ),
      body: Column(
        children: [
          ElevatedButton(onPressed: () {}, child: const Text('Home Screen')),
          ElevatedButton(onPressed: () {}, child: const Text('First Screen')),
          ElevatedButton(onPressed: () {}, child: const Text('Second Screen')),
        ],
      ),
    );
  }
}
