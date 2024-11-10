import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/service/auto_router.gr.dart';

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
          ElevatedButton(
              onPressed: () {
                context.router.push(const HomeRoute());
              },
              child: const Text('Home Screen')),
          ElevatedButton(
              onPressed: () {
                context.router.push(const FirstRoute());
              },
              child: const Text('First Screen')),
          ElevatedButton(
              onPressed: () {
                context.router.push(const SecondRoute());
              },
              child: const Text('Second Screen')),
        ],
      ),
    );
  }
}
