import 'package:flutter/material.dart';
import 'package:super_hero/src/models/hero/hero_model.dart';
import 'package:super_hero/src/widgets/widgets.dart';

class HeroDetailsPage extends StatefulWidget {
  final HeroModel hero;

  const HeroDetailsPage(this.hero, {Key? key}) : super(key: key);

  @override
  _HeroDetailsPageState createState() => _HeroDetailsPageState();
}

class _HeroDetailsPageState extends State<HeroDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.hero.name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: PageView(
          scrollDirection: Axis.vertical,
          children: [
            Container(
              child:  Text(widget.hero.slug),
            ),
            Container(
              child: Column(
                children: [
                  PowerStatsIndicator(widget.hero.powerStats),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
