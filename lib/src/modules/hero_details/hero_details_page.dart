import 'package:flutter/material.dart';
import 'package:super_hero/src/models/hero/hero_model.dart';

class HeroDetailsPage extends StatefulWidget {
  final HeroModel heroModel;

  const HeroDetailsPage(this.heroModel, {Key? key}) : super(key: key);

  @override
  _HeroDetailsPageState createState() => _HeroDetailsPageState();
}

class _HeroDetailsPageState extends State<HeroDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.heroModel.name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: PageView(
          children: [
            Text(widget.heroModel.slug),
          ],
        ),
      ),
    );
  }
}
