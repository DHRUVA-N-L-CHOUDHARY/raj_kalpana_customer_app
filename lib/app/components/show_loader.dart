import 'package:flutter/material.dart';

import '../../config/theme/dark_theme_colors.dart';
import '../../config/theme/light_theme_colors.dart';
import '../data/local/my_shared_pref.dart';

class ShowLoader extends StatefulWidget {
  const ShowLoader({super.key});

  @override
  _ShowLoaderState createState() => _ShowLoaderState();
}

class _ShowLoaderState extends State<ShowLoader>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          color: MySharedPref.getThemeIsLight()
              ? LightThemeColors.kSecondaryColor
              : DarkThemeColors.kSecondaryColor,
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
