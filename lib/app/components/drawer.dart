// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../config/theme/dark_theme_colors.dart';
import '../../config/theme/light_theme_colors.dart';
import '../data/local/my_shared_pref.dart';
import '../routes/app_pages.dart';

class SideDrawer extends StatelessWidget {
  Color kPrimaryColor = MySharedPref.getThemeIsLight()
      ? LightThemeColors.kPrimaryColor
      : DarkThemeColors.kPrimaryColor;
  Color kSecondaryColor = MySharedPref.getThemeIsLight()
      ? LightThemeColors.kSecondaryColor
      : DarkThemeColors.kSecondaryColor;

  SideDrawer({super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          InkWell(
            onTap: () {
              MySharedPref.getUserId() == "guest@email.com"
                  ? print("---------")
                  : Get.toNamed(AppPages.HOME);
              MySharedPref.getUserId() == "guest@email.com"
                  ? print("---------")
                  : Get.toNamed(AppPages.HOME);
            },
            child: ListTile(
              selected: true,
              selectedTileColor: kSecondaryColor,
              minVerticalPadding: 30,
              title: Text(
                MySharedPref.getUserName().capitalize ?? "",
                style: TextStyle(color: kPrimaryColor, fontSize: 25.sp),
              ),
              tileColor: kPrimaryColor,
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: Text(
              'Add Record',
              style: TextStyle(fontSize: 14.sp),
            ),
            onTap: () => {Navigator.pop(context)},
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: Text(
              'Profile',
              style: TextStyle(fontSize: 14.sp),
            ),
            onTap: () => {Get.toNamed(AppPages.SPLASH)},
          ),
          ListTile(
            leading: const Icon(Icons.location_on),
            title: Text(
              'Records Listing',
              style: TextStyle(fontSize: 14.sp),
            ),
            onTap: () => {Get.toNamed(AppPages.RECORDLISTING)},
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: Text(
              'Logout',
              style: TextStyle(fontSize: 14.sp),
            ),
            onTap: () {
              Get.offAllNamed(AppPages.SIGNIN);
              MySharedPref.clearSession();
            },
          ),
        ],
      ),
    );
  }
}
