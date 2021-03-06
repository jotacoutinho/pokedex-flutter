import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_widgets/base/platform_app.dart';
import 'package:platform_widgets/base/platform_theme.dart';
import 'package:pokedex/features/pokedex/pokedex.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PlatformApp(
      platformTheme: PlatformTheme(
        primaryColor: Colors.red,
      ),
      home: Pokedex()
    );
  }
}
