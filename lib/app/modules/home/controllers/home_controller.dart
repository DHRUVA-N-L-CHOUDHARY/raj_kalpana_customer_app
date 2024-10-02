import 'package:get/get.dart';

import '../../../../config/theme/dark_theme_colors.dart';
import '../../../../config/theme/light_theme_colors.dart';
import '../../../data/local/my_shared_pref.dart';

class HomeController extends GetxController{
    var primaryColor = MySharedPref.getThemeIsLight()
      ? LightThemeColors.kPrimaryColor
      : DarkThemeColors.kPrimaryColor;
  var secondaryColor = MySharedPref.getThemeIsLight()
      ? LightThemeColors.kSecondaryColor
      : DarkThemeColors.kSecondaryColor;
}