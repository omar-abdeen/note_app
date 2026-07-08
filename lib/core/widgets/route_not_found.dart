import 'package:flutter/material.dart';

class RouteNotFoundWidget extends StatelessWidget {
  const RouteNotFoundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Error')),
      body: const Center(child: Text('Route not found')),
    );
  }
}
