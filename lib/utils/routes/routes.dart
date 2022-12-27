import 'package:flutter/material.dart';
import 'package:tech_media/utils/routes/route_name.dart';
import 'package:tech_media/view/ForgotPassword/forgotPassword.dart';
import 'package:tech_media/view/login/login_screen.dart';
import 'package:tech_media/view/signup/sign_up_screen.dart';
import 'package:tech_media/view/splash/splash_screen.dart';
import 'package:tech_media/view/Dashboard/Welcome.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      case RouteName.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case RouteName.loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());

      case RouteName.SignUpScreen:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());

      case RouteName.WelcomeScreen:
        return MaterialPageRoute(builder: (_) => WelcomeScreen());

      case RouteName.forgotPassword:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordScreen());

      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          );
        });
    }
  }
}
