import 'package:flutter/material.dart';

/// Shared page transitions for app navigation.
class AppPageTransitions {
  AppPageTransitions._();

  static const Duration forwardDuration = Duration(milliseconds: 380);
  static const Duration reverseDuration = Duration(milliseconds: 300);

  /// Premium dashboard entry: fade in with a subtle rise and scale.
  static Route<T> fadeSlideUp<T>({
    required RouteSettings settings,
    required WidgetBuilder builder,
  }) {
    return PageRouteBuilder<T>(
      settings: settings,
      transitionDuration: forwardDuration,
      reverseTransitionDuration: reverseDuration,
      pageBuilder: (context, animation, secondaryAnimation) => builder(context),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final curved = CurvedAnimation(
          parent: animation,
          curve: Curves.easeOutCubic,
          reverseCurve: Curves.easeInCubic,
        );

        final fade = Tween<double>(begin: 0, end: 1).animate(curved);
        final slide = Tween<Offset>(
          begin: const Offset(0, 0.05),
          end: Offset.zero,
        ).animate(curved);
        final scale = Tween<double>(begin: 0.97, end: 1).animate(curved);

        final outgoingSlide = Tween<Offset>(
          begin: Offset.zero,
          end: const Offset(0, -0.02),
        ).animate(
          CurvedAnimation(
            parent: secondaryAnimation,
            curve: Curves.easeInCubic,
          ),
        );
        final outgoingFade = Tween<double>(begin: 1, end: 0.92).animate(
          CurvedAnimation(
            parent: secondaryAnimation,
            curve: Curves.easeInCubic,
          ),
        );

        return SlideTransition(
          position: outgoingSlide,
          child: FadeTransition(
            opacity: outgoingFade,
            child: FadeTransition(
              opacity: fade,
              child: SlideTransition(
                position: slide,
                child: ScaleTransition(
                  scale: scale,
                  child: child,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  static Route<T> heroDetail<T>({
    required RouteSettings settings,
    required WidgetBuilder builder,
  }) {
    return PageRouteBuilder<T>(
      settings: settings,
      transitionDuration: const Duration(milliseconds: 450),
      reverseTransitionDuration: reverseDuration,
      pageBuilder: (context, animation, secondaryAnimation) => builder(context),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final curved = CurvedAnimation(
          parent: animation,
          curve: const Interval(0.2, 1, curve: Curves.easeOutCubic),
          reverseCurve: Curves.easeInCubic,
        );

        return FadeTransition(
          opacity: curved,
          child: child,
        );
      },
    );
  }
}
