import "package:flutter/material.dart";
import 'package:get/get.dart';
import "app/data/local/my_shared_pref.dart";
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app/routes/app_pages.dart';
import 'config/theme/my_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MySharedPref.init();
  runApp(
    ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      useInheritedMediaQuery: true,
      builder: (context, widget) {
        return GetMaterialApp(
          title: "Bus Management",
          transitionDuration: const Duration(milliseconds: 300),
          defaultTransition: Transition.cupertino,
          builder: (context, widget) {
            bool themeIsLight = MySharedPref.getThemeIsLight();
            return Theme(
              data: MyTheme.getThemeData(isLight: themeIsLight),
              child: WillPopScope(
                onWillPop: () async {
                  bool shouldExit = await _showExitConfirmationDialog();
                  return shouldExit;
                },
                child: MediaQuery(
                  data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                  child: widget!,
                ),
              ),
            );
          },
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
          debugShowCheckedModeBanner: false,
        );
      },
    ),
  );
}

Future<bool> _showExitConfirmationDialog() async {
  return await Get.dialog(
        AlertDialog(
          title: Text('Exit App'),
          content: Text('Are you sure you want to exit the app?'),
          actions: [
            TextButton(
              onPressed: () => Get.back(result: false), // Cancel the exit
              child: Text('No'),
            ),
            TextButton(
              onPressed: () => Get.back(result: true), // Allow the exit
              child: Text('Yes'),
            ),
          ],
        ),
      ) ??
      false;
}
