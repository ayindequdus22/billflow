import 'package:billflow/screens/add-bill/add_bill.dart';
import 'package:billflow/screens/auth/login.dart';
import 'package:billflow/screens/auth/register.dart';
import 'package:billflow/screens/auth/verify_email.dart';
import 'package:billflow/screens/auth/verify_email_succesful.dart';
import 'package:billflow/screens/bill_details/bill_details.dart';
import 'package:billflow/screens/home/home.dart';
import 'package:billflow/screens/onboarding.dart';
import 'package:billflow/screens/set-up/start_setup.dart';
import 'package:billflow/screens/splash.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnGenerateRoute {
  static GetPage<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return GetPage(name: "/", page: () => const SplashScreen());

      case "/onboarding":
        return GetPage(
          name: "/onboarding",
          page: () => const OnboardingScreen(),
        );
      case "/auth/login":
        return GetPage(name: "/auth/login", page: () => const LoginScreen());
      case "/auth/register":
        return GetPage(
          name: "/auth/register",
          page: () => const RegisterScreen(),
        );
      case "/home":
        return GetPage(name: "/home", page: () => const HomeScreen());
      case "/auth/verify-mail":
        return GetPage(
          name: "/auth/verify-mail",
          page: () => const VerifyEmailScreen(),
        );
      case "/auth/verify-mail/success":
        return GetPage(
          name: "/auth/verify-mail/success",
          page: () => const VerifyEmailSuccesful(),
        );
      case "/setup":
        return GetPage(name: "/setup", page: () => const StartSetup());
      case "/add-bill":
        return GetPage(name: "/add-bill", page: () => const AddBill());
      case "bill-details":
        return GetPage(name: "bill-details/:id", page: () => BillDetails());
      default:
        return GetPage(name: "default", page: () => Container());
    }
  }
}
