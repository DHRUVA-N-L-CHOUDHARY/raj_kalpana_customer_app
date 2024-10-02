import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../data/local/my_shared_pref.dart';
import '../../../data/remote/api_service.dart';
import '../../../routes/app_pages.dart';

class LoginController extends GetxController {
  TextEditingController phonController = new TextEditingController();
  RxBool isLoading = false.obs;

  void onSuccess(String accessToken) async {
    isLoading.value = true;
    update();
    dynamic res = await ApiService().createUserAccount({
      "userName":
          "",
      "phoneNumber": "",
      "accountType": "Driver"
    });
    if (res.statusCode == 201) {
      res = jsonDecode(res.body);
      if (res["message"] == "User registered successfully") {
        MySharedPref.setUserId(res["user"]["_id"]);
        MySharedPref.setPhoneNumber(res["user"]["phoneNumber"]);
        MySharedPref.setUserName(res["user"]["userName"]);
        MySharedPref.setToken(res["user"]["token"]);
        Get.offAllNamed(AppPages.ADDRECORD);
      }
    } else {
      res = jsonDecode(res.body);
      if (res["message"] == "User already exists with this phone number.") {
        dynamic resu = await ApiService()
            .getUserDetails(phonController.text);
        resu = jsonDecode(resu.body);
        resu = resu["user"];
        print(resu);
        if (resu["_id"] != null) {
          MySharedPref.setUserId(resu["_id"]);
          MySharedPref.setPhoneNumber(resu["phoneNumber"]);
          MySharedPref.setUserName(resu["userName"]);
          MySharedPref.setToken(resu["token"]);
          Get.offAllNamed(AppPages.HOME);
        }
      } else {
        Get.snackbar("Error", "Couldn't find the user");
      }
    }
    isLoading.value = false;
    update();
  }
}
