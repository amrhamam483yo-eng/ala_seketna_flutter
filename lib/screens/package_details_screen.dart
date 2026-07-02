import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PackageDetailsScreen extends StatelessWidget {
  final String tripId;

  const PackageDetailsScreen({super.key, required this.tripId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Package Details'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/home'),
        ),
      ),
      body: const Center(
        child: Text('Package Details Screen'),
      ),
    );
  }
}
