import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Radio NP')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Page Not Found', style: Theme.of(context).textTheme.headlineLarge),
            const SizedBox(height: 8),
            FilledButton(
              onPressed: () => context.go('/'),
              child: const Text('Go back'),
            ),
          ],
        ),
      ),
    );
  }
}
