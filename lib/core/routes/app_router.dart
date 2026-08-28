import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nour_store/core/routes/routes.dart';
import 'package:nour_store/core/utilies/di.dart';

class AppRouter {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        // return _splashRoute(settings);
      case Routes.onboarding:
        // return _onboardingRoute(settings);
      case Routes.login:
        // return _loginRoute(settings);
      case Routes.forgotPassword:
        // return MaterialPageRoute(
        //   settings: settings,
        //   builder: (_) => BlocProvider(
        //     create: (_) => getIt<ForgotPasswordCubit>(),
        //     child: const ForgotPasswordScreen(),
        //   ),
        // );
      case Routes.register:
        // return _registerRoute(settings);
      case Routes.home:
        // return _homeRoute(settings);
      case Routes.assetDetails:
        // return _assetDetailsRoute(settings);
      default:
        // return _splashRoute(settings);
    }
  }



  // static MaterialPageRoute<dynamic> _splashRoute(RouteSettings settings) {
  //   return MaterialPageRoute(
  //     settings: settings,
  //     builder: (_) => BlocProvider(
  //       create: (_) => getIt<SplashCubit>()..start(),
  //       child: const SplashScreen(),
  //     ),
  //   );
  // }

  // static MaterialPageRoute<dynamic> _onboardingRoute(RouteSettings settings) {
  //   return MaterialPageRoute(
  //     settings: settings,
  //     builder: (_) => BlocProvider(
  //       create: (_) => getIt<OnboardingCubit>(),
  //       child: const OnboardingScreen(),
  //     ),
  //   );
  // }

  // static MaterialPageRoute<dynamic> _loginRoute(RouteSettings settings) {
  //   return MaterialPageRoute(
  //     settings: settings,
  //     builder: (_) => BlocProvider(
  //       create: (_) => getIt<LoginCubit>(),
  //       child: const LoginScreen(),
  //     ),
  //   );
  // }

  // static MaterialPageRoute<dynamic> _registerRoute(RouteSettings settings) {
  //   return MaterialPageRoute(
  //     settings: settings,
  //     builder: (_) => BlocProvider(
  //       create: (_) => getIt<RegisterCubit>(),
  //       child: const RegisterScreen(),
  //     ),
  //   );
  // }
}
