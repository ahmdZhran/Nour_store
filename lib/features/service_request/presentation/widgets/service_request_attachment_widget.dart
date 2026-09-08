import 'package:flutter/material.dart';
import 'package:nour_store/core/languages/localization_extension.dart';
import 'package:nour_store/core/responsive/responsive_sizing.dart';
import 'package:nour_store/core/theme/theme_colors.dart';
import 'package:nour_store/core/utilies/app_strings.dart';
import 'package:nour_store/core/utilies/app_text_styles.dart';
import 'package:nour_store/features/service_request/presentation/widgets/service_request_field_widget.dart';

class ServiceRequestAttachmentWidget extends StatelessWidget {
  const ServiceRequestAttachmentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textSecondary =
        isDark ? ThemeColors.darkTextSecondary : ThemeColors.lightTextSecondary;
    final borderColor =
        isDark ? ThemeColors.darkDivider : ThemeColors.lightCardBorder;
    final iconColor =
        isDark ? ThemeColors.darkTextHint : ThemeColors.lightTextHint;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ServiceRequestFieldLabel(
          label: context.tr(AppStrings.serviceRequestAttachPhotos),
          isRequired: false,
          trailing: context.tr(AppStrings.serviceRequestOptional),
        ),
        SizedBox(height: context.rh(8)),
        CustomPaint(
          painter: _DashedRRectPainter(
            color: borderColor,
            radius: context.rr(14),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.symmetric(
              horizontal: context.rw(16),
              vertical: context.rh(18),
            ),
            child: Column(
              children: [
                Icon(
                  Icons.cloud_upload_outlined,
                  color: iconColor,
                  size: context.rsp(36),
                ),
                SizedBox(height: context.rh(10)),
                Text(
                  context.tr(AppStrings.serviceRequestDropFile),
                  textAlign: TextAlign.center,
                  style: AppTextStyles.servicesCraftsmanName.copyWith(
                    color: textSecondary,
                    fontSize: context.rsp(13),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: context.rh(12)),
                _ChooseFilesButton(onPressed: () {}),
                SizedBox(height: context.rh(12)),
                Text(
                  context.tr(AppStrings.serviceRequestFileTypes),
                  textAlign: TextAlign.center,
                  style: AppTextStyles.serviceRequestHelper.copyWith(
                    color: textSecondary,
                    fontSize: context.rsp(11),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _ChooseFilesButton extends StatelessWidget {
  const _ChooseFilesButton({required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.rh(36),
      child: FilledButton(
        onPressed: onPressed,
        style: FilledButton.styleFrom(
          backgroundColor: ThemeColors.goldPrimary,
          foregroundColor: ThemeColors.blackColorF1,
          padding: EdgeInsetsDirectional.symmetric(horizontal: context.rw(22)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(context.rr(10)),
          ),
        ),
        child: Text(
          context.tr(AppStrings.serviceRequestChooseFiles),
          style: AppTextStyles.servicesCraftsmanName.copyWith(
            color: ThemeColors.blackColorF1,
            fontSize: context.rsp(13),
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}

class _DashedRRectPainter extends CustomPainter {
  const _DashedRRectPainter({
    required this.color,
    required this.radius,
  });

  final Color color;
  final double radius;

  static const double _dash = 6;
  static const double _gap = 4;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.2;
    final path = Path()
      ..addRRect(
        RRect.fromRectAndRadius(
          Offset.zero & size,
          Radius.circular(radius),
        ),
      );

    for (final metric in path.computeMetrics()) {
      var distance = 0.0;
      while (distance < metric.length) {
        final end = (distance + _dash).clamp(0.0, metric.length);
        canvas.drawPath(metric.extractPath(distance, end), paint);
        distance = end + _gap;
      }
    }
  }

  @override
  bool shouldRepaint(covariant _DashedRRectPainter oldDelegate) {
    return oldDelegate.color != color || oldDelegate.radius != radius;
  }
}
