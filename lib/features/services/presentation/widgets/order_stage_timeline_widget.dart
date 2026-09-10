import 'package:flutter/material.dart';
import 'package:nour_store/core/languages/localization_extension.dart';
import 'package:nour_store/core/responsive/responsive_sizing.dart';
import 'package:nour_store/core/theme/theme_colors.dart';
import 'package:nour_store/core/utilies/app_text_styles.dart';
import 'package:nour_store/features/services/presentation/models/services_orders_mock_data.dart';

class OrderStageTimelineWidget extends StatelessWidget {
  const OrderStageTimelineWidget({
    super.key,
    required this.stages,
  });

  final List<OrderStageItem> stages;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textPrimary =
        isDark ? ThemeColors.darkTextPrimary : ThemeColors.lightTextPrimary;
    final textSecondary =
        isDark ? ThemeColors.darkTextSecondary : ThemeColors.lightTextSecondary;

    return Column(
      children: [
        for (var index = 0; index < stages.length; index++) ...[
          _StageRow(
            stage: stages[index],
            textPrimary: textPrimary,
            textSecondary: textSecondary,
            showConnector: index < stages.length - 1,
          ),
        ],
      ],
    );
  }
}

class _StageRow extends StatelessWidget {
  const _StageRow({
    required this.stage,
    required this.textPrimary,
    required this.textSecondary,
    required this.showConnector,
  });

  final OrderStageItem stage;
  final Color textPrimary;
  final Color textSecondary;
  final bool showConnector;

  @override
  Widget build(BuildContext context) {
    final iconSize = context.rw(36);

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: iconSize,
            child: Column(
              children: [
                Container(
                  width: iconSize,
                  height: iconSize,
                  decoration: BoxDecoration(
                    color: stage.iconColor.withValues(alpha: 0.18),
                    borderRadius: BorderRadius.circular(context.rr(10)),
                    border: stage.isActive
                        ? Border.all(
                            color: stage.iconColor.withValues(alpha: 0.45),
                            width: 2,
                          )
                        : null,
                  ),
                  child: Icon(
                    stage.icon,
                    size: context.rsp(20),
                    color: stage.iconColor,
                  ),
                ),
                if (showConnector)
                  Expanded(
                    child: Container(
                      width: 2,
                      margin: EdgeInsets.symmetric(vertical: context.rh(4)),
                      color: ThemeColors.goldPrimary.withValues(alpha: 0.45),
                    ),
                  ),
              ],
            ),
          ),
          SizedBox(width: context.rw(12)),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: context.rh(showConnector ? 16 : 0)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.tr(stage.titleKey),
                    style: AppTextStyles.servicesCraftsmanName.copyWith(
                      color: textPrimary,
                      fontSize: context.rsp(14),
                    ),
                  ),
                  SizedBox(height: context.rh(4)),
                  Text(
                    context.tr(stage.descriptionKey),
                    style: AppTextStyles.servicesCraftsmanTitle.copyWith(
                      color: textSecondary,
                      fontSize: context.rsp(12),
                      height: 1.35,
                    ),
                  ),
                  SizedBox(height: context.rh(4)),
                  Text(
                    context.tr(stage.dateKey),
                    style: AppTextStyles.servicesCraftsmanTitle.copyWith(
                      color: textSecondary,
                      fontSize: context.rsp(11),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
