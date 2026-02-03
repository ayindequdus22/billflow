import 'package:billflow/screens/add-bill/add_bill.dart';
import 'package:billflow/screens/auth/login.dart';
import 'package:billflow/screens/auth/register.dart';
import 'package:billflow/screens/auth/verify_email.dart';
import 'package:billflow/screens/auth/verify_email_succesful.dart';
import 'package:billflow/screens/home/home.dart';
import 'package:billflow/screens/onboarding.dart';
import 'package:billflow/screens/set-up/start_setup.dart';
import 'package:billflow/screens/splash.dart';
import 'package:flutter/material.dart';

class OnGenerateRoute {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case "/onboarding":
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case "/auth/login":
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case "/auth/register":
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case "/home":
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case "/auth/verify-mail":
        return MaterialPageRoute(builder: (_) => const VerifyEmailScreen());
      case "/auth/verify-mail/success":
        return MaterialPageRoute(builder: (_) => const VerifyEmailSuccesful());
      case "/setup":
        return MaterialPageRoute(builder: (_) => const StartSetup());
      case "/add-bill":
        return MaterialPageRoute(builder: (_) => const AddBill());

      default:
        return MaterialPageRoute(builder: (_) => Container());
    }
  }
}
