import 'package:flutter/material.dart';
import 'package:nour_store/core/languages/localization_extension.dart';
import 'package:nour_store/core/responsive/responsive_sizing.dart';
import 'package:nour_store/core/theme/theme_colors.dart';
import 'package:nour_store/core/utilies/app_strings.dart';
import 'package:nour_store/core/utilies/app_text_styles.dart';
import 'package:nour_store/features/services/presentation/models/services_orders_mock_data.dart';

class OrderAppointmentPickerWidget extends StatelessWidget {
  const OrderAppointmentPickerWidget({
    super.key,
    required this.slots,
    required this.selectedSlotId,
    required this.onSlotSelected,
    required this.onConfirm,
  });

  final List<AppointmentSlotItem> slots;
  final String? selectedSlotId;
  final ValueChanged<String> onSlotSelected;
  final VoidCallback onConfirm;

  static const double _borderRadius = 12;
  static const double _buttonHeight = 40;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textPrimary =
        isDark ? ThemeColors.darkTextPrimary : ThemeColors.lightTextPrimary;
    final textSecondary =
        isDark ? ThemeColors.darkTextSecondary : ThemeColors.lightTextSecondary;
    final radius = BorderRadius.circular(context.rr(_borderRadius));

    return Material(
      color: ThemeColors.darkSurface,
      borderRadius: radius,
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: radius,
          border: Border.all(
            color: ThemeColors.lightBorder.withValues(alpha: 0.3),
          ),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.all(context.rw(12)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                context.tr(AppStrings.ordersPickAppointmentTitle),
                style: AppTextStyles.servicesCraftsmanName.copyWith(
                  color: textPrimary,
                  fontSize: context.rsp(14),
                ),
              ),
              SizedBox(height: context.rh(12)),
              for (final slot in slots) ...[
                _AppointmentSlotTile(
                  slot: slot,
                  isSelected: slot.id == selectedSlotId,
                  textPrimary: textPrimary,
                  textSecondary: textSecondary,
                  onTap: () => onSlotSelected(slot.id),
                ),
                SizedBox(height: context.rh(8)),
              ],
              SizedBox(height: context.rh(4)),
              SizedBox(
                height: context.rh(_buttonHeight),
                child: FilledButton(
                  onPressed: selectedSlotId == null ? null : onConfirm,
                  style: FilledButton.styleFrom(
                    backgroundColor: ThemeColors.goldPrimary,
                    disabledBackgroundColor:
                        ThemeColors.goldPrimary.withValues(alpha: 0.35),
                    foregroundColor: ThemeColors.whiteColor,
                    padding: EdgeInsets.zero,
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(context.rr(8)),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    context.tr(AppStrings.ordersConfirmAppointment),
                    style: AppTextStyles.servicesCraftsmanTitle.copyWith(
                      color: ThemeColors.whiteColor,
                      fontSize: context.rsp(13),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AppointmentSlotTile extends StatelessWidget {
  const _AppointmentSlotTile({
    required this.slot,
    required this.isSelected,
    required this.textPrimary,
    required this.textSecondary,
    required this.onTap,
  });

  final AppointmentSlotItem slot;
  final bool isSelected;
  final Color textPrimary;
  final Color textSecondary;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(context.rr(10)),
        child: Ink(
          padding: EdgeInsetsDirectional.symmetric(
            horizontal: context.rw(12),
            vertical: context.rh(10),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(context.rr(10)),
            border: Border.all(
              color: isSelected
                  ? ThemeColors.goldPrimary
                  : ThemeColors.lightBorder.withValues(alpha: 0.35),
              width: isSelected ? 1.5 : 1,
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      context.tr(slot.dayKey),
                      style: AppTextStyles.servicesCraftsmanName.copyWith(
                        color: textPrimary,
                        fontSize: context.rsp(13),
                      ),
                    ),
                    SizedBox(height: context.rh(2)),
                    Text(
                      context.tr(slot.timeKey),
                      style: AppTextStyles.servicesCraftsmanTitle.copyWith(
                        color: textSecondary,
                        fontSize: context.rsp(11),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: context.rw(20),
                height: context.rw(20),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: ThemeColors.goldPrimary,
                    width: 1.5,
                  ),
                ),
                child: isSelected
                    ? Center(
                        child: Container(
                          width: context.rw(10),
                          height: context.rw(10),
                          decoration: const BoxDecoration(
                            color: ThemeColors.goldPrimary,
                            shape: BoxShape.circle,
                          ),
                        ),
                      )
                    : null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
