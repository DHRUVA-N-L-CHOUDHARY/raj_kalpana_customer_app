// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../config/theme/dark_theme_colors.dart';
import '../../config/theme/light_theme_colors.dart';
import '../../config/theme/my_fonts.dart';
import '../../config/theme/my_styles.dart';
import '../data/local/my_shared_pref.dart';

class AppTextField extends StatelessWidget {
  final double? height;
  final double? radius;
  final EdgeInsets? padding;
  final int? maxLines;
  final double? cursorHeight;
  final String? hintText;
  final EdgeInsets? contentPadding;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final TextInputType? keyBoardType;
  final bool? isPwdMode;
  final List<TextInputFormatter>? inputFormatters;
  RxBool? isObscure;
  Widget? suffixIcon;
  EdgeInsets? margin;
  FocusNode? focusNode;
  AppTextField(
      {required this.controller,
      this.onChanged,
      this.height = 50,
      this.radius = 4.0,
      this.padding,
      this.maxLines = 1,
      this.cursorHeight = 20.0,
      this.hintText = "",
      this.contentPadding,
      this.keyBoardType,
      this.isPwdMode = false,
      this.inputFormatters,
      this.suffixIcon,
      this.margin,
      this.focusNode,
      super.key}) {
    isObscure = RxBool(false);
  }

  AppTextField.password({
    required this.controller,
    this.onChanged,
    this.height = 50,
    this.radius = 4.0,
    this.margin,
    this.maxLines = 1,
    this.cursorHeight = 20.0,
    this.hintText = "",
    this.contentPadding,
    this.keyBoardType,
    this.isPwdMode = true,
    this.inputFormatters,
    this.suffixIcon,
    this.padding,
    this.focusNode,
    Key? key,
  }) : super(key: key) {
    isObscure = RxBool(true);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Stack(
        children: [
          Container(
            height: height!.h,
            decoration: BoxDecoration(
              border: Border.all(
                  color: MySharedPref.getThemeIsLight()
                      ? LightThemeColors.kSecondaryColor.withAlpha(50)
                      : DarkThemeColors.kSecondaryColor.withAlpha(50)),
              borderRadius: BorderRadius.circular(radius!.r),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 8.0.dg),
            child: Obx(() => TextField(
                  controller: controller,
                  focusNode: focusNode,
                  onChanged: onChanged ?? (t) {},
                  maxLines: maxLines,
                  cursorHeight: cursorHeight!.h,
                  obscureText: isObscure!.value,
                  inputFormatters: inputFormatters,
                  keyboardType: keyBoardType,
                  decoration: InputDecoration(
                      hintText: hintText,
                      hintStyle: MyStyles.getTextStyle(
                          color: Colors.grey.shade400, fontSize: 16.sp),
                      contentPadding: contentPadding ?? EdgeInsets.zero,
                      border: InputBorder.none,
                      suffixIcon: isPwdMode!
                          ? isObscure!.value
                              ? InkWell(
                                  onTap: () {
                                    isObscure!.value = !isObscure!.value;
                                  },
                                  child: Icon(Icons.visibility_off,
                                      color: MySharedPref.getThemeIsLight()
                                          ? LightThemeColors.kSecondaryColor
                                          : DarkThemeColors.kSecondaryColor))
                              : InkWell(
                                  onTap: () {
                                    isObscure!.value = !isObscure!.value;
                                  },
                                  child: Icon(Icons.visibility,
                                      color: MySharedPref.getThemeIsLight()
                                          ? LightThemeColors.kSecondaryColor
                                          : DarkThemeColors.kSecondaryColor))
                          : suffixIcon),
                  style: MyStyles.getTextStyle(
                      fontSize: MyFonts.textFieldOrContentSize,
                      color: MySharedPref.getThemeIsLight()
                          ? LightThemeColors.kSecondaryColor
                          : DarkThemeColors.kSecondaryColor),
                )),
          ),
        ],
      ),
    );
  }
}
