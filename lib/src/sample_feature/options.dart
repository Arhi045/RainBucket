import 'package:flutter/material.dart';

/// Displays detailed information about a SampleItem.
class Options extends StatelessWidget {
  const Options({super.key});

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RainBucket'),
      ),
      body: const Center(
        child: Text('More Information Here'),
      ),
    );
  }
}
