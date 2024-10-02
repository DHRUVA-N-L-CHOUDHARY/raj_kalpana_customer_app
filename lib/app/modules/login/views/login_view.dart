
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../config/theme/dark_theme_colors.dart';
import '../../../../config/theme/light_theme_colors.dart';
import '../../../../utils/constants.dart';
import '../../../components/app_button.dart';
import '../../../components/show_loader.dart';
import '../../../components/text_field.dart';
import '../../../data/local/my_shared_pref.dart';
import '../../../routes/app_pages.dart';
import '../controllers/login_controller.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
        init: LoginController(),
        builder: (c) {
          return c.isLoading.value
              ? Scaffold(body: ShowLoader())
              : Scaffold(
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
                        height: 40.h,
                      ),
                      Center(
                        child: Text(
                          "Welcome to Arrowspeed",
                          textAlign: TextAlign.center,
                          style: Get.textTheme.headlineMedium,
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Center(
                        child: Text(
                          "Login using you mobile number \n to sign in",
                          textAlign: TextAlign.center,
                          style: Get.textTheme.bodyLarge,
                        ),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20.0.dg, vertical: 10.h),
                        child: Text(
                          "Your mobile number",
                          style: Get.textTheme.bodyLarge,
                        ),
                      ),
                      AppTextField(
                        margin: EdgeInsets.symmetric(horizontal: 20.dg),
                        contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
                        controller: c.phonController,
                        hintText: "91+ 9876543210",
                      ),
                      
                    ],
                  ),
                  bottomNavigationBar: SizedBox(
                    height: Get.height * 0.15,
                    child: Column(
                      children: [
                        Center(
                            child: 
                            AppButton(
                              text: "Get OTP",
                              onPressed: () {
                                MySharedPref.setPhoneNumber(c.phonController.text);
                                Get.toNamed(AppPages.VERIFYOTP);
                              },
                            ),
                            ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Center(
                          child: Text(
                            "By pressing this you agree to our Privacy policy and \n Terms and Conditions",
                            textAlign: TextAlign.center,
                            style: Get.textTheme.bodyMedium,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
        });
  }
}
