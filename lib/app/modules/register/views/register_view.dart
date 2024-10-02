import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../config/theme/my_fonts.dart';
import '../../../../utils/constants.dart';
import '../../../components/app_button.dart';
import '../../../components/text_field.dart';
import '../../../data/local/my_shared_pref.dart';
import '../../../routes/app_pages.dart';
import '../controllers/register_controller.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterController>(
        init: RegisterController(),
        builder: (c) {
          return Scaffold(
            body: ListView(
              children: [
                SizedBox(
                  height: 30.h,
                ),
                Center(
                  child: Image.asset(
                    appConst + AppImages.kAppIconNamed,
                    width: Get.width * 0.35,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Center(
                  child: Text(
                    "Enter your information",
                    textAlign: TextAlign.center,
                    style: Get.textTheme.headlineMedium,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Center(
                  child: Text(
                    "Fill up your personal information for \nseamless experience",
                    textAlign: TextAlign.center,
                    style: Get.textTheme.bodyMedium,
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0.dg, vertical: 5.h),
                  child: Text(
                    "Name",
                    style: Get.textTheme.bodyLarge,
                  ),
                ),
                AppTextField(
                  margin: EdgeInsets.symmetric(horizontal: 20.dg),
                  contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
                  controller: c.nameController,
                  hintText: "Eddy Kim",
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0.dg, vertical: 5.h),
                  child: Text(
                    "E-mail",
                    style: Get.textTheme.bodyLarge,
                  ),
                ),
                AppTextField(
                  margin: EdgeInsets.symmetric(horizontal: 20.dg),
                  contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
                  controller: c.emailController,
                  hintText: "eddiykimonline@kmail.kr",
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0.dg, vertical: 5.h),
                  child: Text(
                    "Age",
                    style: Get.textTheme.bodyLarge,
                  ),
                ),
                AppTextField(
                  margin: EdgeInsets.symmetric(horizontal: 20.dg),
                  contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
                  controller: c.ageController,
                  hintText: "29",
                ),
              ],
            ),
            bottomNavigationBar: SizedBox(
              height: Get.height * 0.15,
              child: Column(
                children: [
                  Center(
                    child: Text(
                      "Skip",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: MyFonts.textFieldOrContentSize),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Center(
                    child: AppButton(
                      text: "Save",
                      onPressed: () {
                        MySharedPref.setPhoneNumber("+91 9876543210");
                        Get.toNamed(AppPages.HOME);
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
