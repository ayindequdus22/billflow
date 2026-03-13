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
import 'package:get/get.dart';

class AppRoutes {
  static const splash = "/";
  static const onboarding = "/onboarding";

  static const login = "/auth/login";
  static const register = "/auth/register";

  static const verifyMail = "/auth/verify-mail";
  static const verifyMailSuccess = "/auth/verify-mail/success";

  static const home = "/home";

  static const setup = "/setup";
  static const addBill = "/add-bill";

  static const billDetails = "/bill-details/:id";
}

class AppPages {
  static final routes = [
    GetPage(name: AppRoutes.splash, page: () => const SplashScreen()),

    GetPage(name: AppRoutes.onboarding, page: () => const OnboardingScreen()),
    GetPage(name: AppRoutes.login, page: () => const LoginScreen()),

    GetPage(name: AppRoutes.register, page: () => const RegisterScreen()),

    GetPage(
      name: AppRoutes.verifyMailSuccess,
      page: () => const VerifyEmailSuccesful(),
    ),
    GetPage(name: AppRoutes.verifyMail, page: () => const VerifyEmailScreen()),
    GetPage(name: AppRoutes.setup, page: () => const StartSetup()),
    GetPage(name: AppRoutes.home, page: () => const HomeScreen()),

    GetPage(name: AppRoutes.addBill, page: () => const AddBill()),

    GetPage(name: AppRoutes.billDetails, page: () => BillDetails()),
  ];
}
