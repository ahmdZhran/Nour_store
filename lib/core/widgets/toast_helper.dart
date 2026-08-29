import 'package:flutter/material.dart';
import 'package:nour_store/core/theme/theme_colors.dart';

/// App-wide messenger so toasts survive route pops (e.g. after register / reset).
final GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();

class ToastHelper {
  static const Duration _defaultDuration = Duration(seconds: 4);

  static void showErrorToast(String message) {
    // _show(
    //   message: message,
    //   icon: Icons.error_outline_rounded,
    //   // accent: ThemeColors.tertiary,
    //   duration: _defaultDuration,
    // );
  }

  static void showSuccessToast(String message) {
    _show(
      message: message,
      icon: Icons.check_circle_outline_rounded,
      accent: ThemeColors.goldPrimary,
      duration: _defaultDuration,
    );
  }

  static void showWarningToast(String message) {
    _show(
      message: message,
      icon: Icons.warning_amber_rounded,
      accent: const Color(0xFFD4A843),
      duration: _defaultDuration,
    );
  }

  static void showInfoToast(String message) {
    _show(
      message: message,
      icon: Icons.info_outline_rounded,
      accent: ThemeColors.goldPrimary,
      duration: _defaultDuration,
    );
  }

  static void showSuccessWithAction(BuildContext context, String message) {
    final messenger = ScaffoldMessenger.of(context);
    messenger.clearSnackBars();
    messenger.showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        elevation: 0,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        duration: const Duration(seconds: 6),
        content: _ToastCard(
          message: message,
          icon: Icons.check_circle_outline_rounded,
          accent: ThemeColors.goldPrimary,
          actionLabel: 'Open Gmail',
          onAction: () {},
        ),
      ),
    );
  }

  static void _show({
    required String message,
    required IconData icon,
    required Color accent,
    required Duration duration,
  }) {
    final messenger = rootScaffoldMessengerKey.currentState;
    if (messenger == null) return;

    messenger.clearSnackBars();
    messenger.showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        elevation: 0,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        duration: duration,
        content: _ToastCard(
          message: message,
          icon: icon,
          accent: accent,
        ),
      ),
    );
  }

}

class _ToastCard extends StatelessWidget {
  const _ToastCard({
    required this.message,
    required this.icon,
    required this.accent,
    this.actionLabel,
    this.onAction,
  });

  final String message;
  final IconData icon;
  final Color accent;
  final String? actionLabel;
  final VoidCallback? onAction;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          color: ThemeColors.whiteColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: ThemeColors.greyColorE9),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.45),
              blurRadius: 18,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: accent.withValues(alpha: 0.16),
                borderRadius: BorderRadius.circular(8),
              ),
              alignment: Alignment.center,
              child: Icon(icon, size: 18, color: accent),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                message,
                style: const TextStyle(
                  color: ThemeColors.whiteColor,
                  fontSize: 13.5,
                  fontWeight: FontWeight.w500,
                  height: 1.35,
                ),
              ),
            ),
            if (actionLabel != null && onAction != null) ...[
              const SizedBox(width: 8),
              TextButton(
                onPressed: onAction,
                style: TextButton.styleFrom(
                  foregroundColor: accent,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: Text(
                  actionLabel!,
                  style: TextStyle(
                    color: accent,
                    fontSize: 12.5,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
