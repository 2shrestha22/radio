import 'package:awesome_flutter_extensions/awesome_flutter_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:go_router/go_router.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Radio NP'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Page Not Found',
              style: context.textStyles.headlineLarge,
            ),
            const Gutter(),
            FilledButton(
                onPressed: () {
                  context.go('/');
                },
                child: const Text('Go back'))
          ],
        ),
      ),
    );
  }
}
