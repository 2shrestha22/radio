import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:radio/home_page.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
part '_router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ShadApp.router(
      title: 'Flutter Demo',
      routerConfig: _router,
    );
  }
}
