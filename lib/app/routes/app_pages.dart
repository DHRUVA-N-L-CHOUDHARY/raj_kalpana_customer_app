
import 'package:get/get.dart';
import 'package:travelapp/app/modules/home/views/home_view.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/verify_otp/views/verify_otp_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;
  static const SIGNIN = Routes.SIGNIN;
  static const VERIFYOTP = Routes.VERIFYOTP;
  static const SIGNUP = Routes.SIGNUP;
  static const DASHBOARD = Routes.DASHBOARD;
  static const SEARCH = Routes.SEARCH;
  static const CHECKOUT = Routes.CHECKOUT;
  static const SPLASH = Routes.SPLASH;
  static const HOME = Routes.HOME;
  static const ADDRECORD = Routes.ADDRECORD;
  static const RECORDLISTING = Routes.RECORDLISTING;
  static const RECORDDETAIL = Routes.RECORDDETAIL;
  static const PROFILE = Routes.PROFILE;
  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.SIGNIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.VERIFYOTP,
      page: () => const VerifyOTPView(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    // GetPage(
    //   name: _Paths.ADDRECORD,
    //   page: () => const AddRecordView(),
    //   binding: AddRecordBinding(),
    // ),
    // GetPage(
    //     name: _Paths.RECORDLISTING,
    //     page: () => const RecordListingView(),
    //     transition: Transition.downToUp,
    //     transitionDuration: Duration(milliseconds: 100)),
    // GetPage(
    //   name: _Paths.RECORDDETAIL,
    //   page: () => const RecordListingView(),
    //   // binding: LoginBinding(),
    // ),
    // GetPage(
    //   name: _Paths.PROFILE,
    //   page: () => ProfileView(),
    //   binding: ProfileBinding(),
    // ),
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
  ];
}
