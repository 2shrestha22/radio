import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:radio/home_page.dart';
import 'package:radio/theme/theme.dart';
part '_router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
      theme: appTheme(context),
    );
  }
}
