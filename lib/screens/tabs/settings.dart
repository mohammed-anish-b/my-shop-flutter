import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          expandedHeight: 150.0,
          flexibleSpace: const FlexibleSpaceBar(
            title: Text('Settings'),
          ),
          floating: true,
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            <Widget>[
              Container(
                height: 1200.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft:  const  Radius.circular(40.0),
                    topRight: const  Radius.circular(40.0))
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}