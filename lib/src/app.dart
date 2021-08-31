import 'package:flutter/material.dart';
import 'package:super_hero/src/pages/pages.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Super Hero",
      home: HomePage(),
    );
  }
}
