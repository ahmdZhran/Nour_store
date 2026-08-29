import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:nour_store/core/responsive/responsive_sizing.dart';
import 'package:nour_store/core/theme/theme_colors.dart';
import 'package:nour_store/core/utilies/app_text_styles.dart';
import 'package:nour_store/core/widgets/directional_icon.dart';

class SelectionHeroCardWidget extends StatelessWidget {
  const SelectionHeroCardWidget({
    super.key,
    required this.backgroundAsset,
    required this.overlayTitle,
    required this.actionTitle,
    required this.actionSubtitle,
    required this.icon,
    required this.onTap,
  });

  final String backgroundAsset;
  final String overlayTitle;
  final String actionTitle;
  final String actionSubtitle;
  final IconData icon;
  final VoidCallback onTap;

  static const double _cardHeight = 190;
  static const double _borderRadius = 20;
  static const double _overlayRadius = 12;
  static const double _overlayHeight = 48;
  static const double _actionBarHeight = 72;
  static const double _iconContainerSize = 44;
  static const double _chevronContainerSize = 32;

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(context.rr(_borderRadius));
    final overlayRadius = BorderRadius.circular(context.rr(_overlayRadius));
    final iconContainerSize = context.rw(_iconContainerSize);
    final chevronContainerSize = context.rw(_chevronContainerSize);

    return Material(
      color: Colors.transparent,
      borderRadius: radius,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        borderRadius: radius,
        splashColor: ThemeColors.goldPrimary.withValues(alpha: 0.12),
        highlightColor: ThemeColors.goldPrimary.withValues(alpha: 0.06),
        child: Ink(
          height: context.rh(_cardHeight),
          decoration: BoxDecoration(
            borderRadius: radius,
            border: Border.all(
              color: ThemeColors.lightBorder.withValues(alpha: 0.3),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.35),
                blurRadius: 24,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: radius,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(
                  backgroundAsset,
                  fit: BoxFit.cover,
                ),
                DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withValues(alpha: 0.2),
                        Colors.black.withValues(alpha: 0.4),
                        Colors.black.withValues(alpha: 0.8),
                      ],
                    ),
                  ),
                ),
                PositionedDirectional(
                  top: context.rh(16),
                  start: context.rw(16),
                  end: context.rw(16),
                  height: context.rh(_overlayHeight),
                  child: ClipRRect(
                    borderRadius: overlayRadius,
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: ThemeColors.darkSurface.withValues(alpha: 0.2),
                          borderRadius: overlayRadius,
                          border: Border.all(
                            color: ThemeColors.whiteColor.withValues(alpha: 0.1),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            overlayTitle,
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyles.heroOverlayTitle.copyWith(
                              fontSize: context.rsp(20),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                PositionedDirectional(
                  start: 0,
                  end: 0,
                  bottom: 0,
                  height: context.rh(_actionBarHeight),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: ThemeColors.darkCard.withValues(alpha: 0.95),
                      border: Border(
                        top: BorderSide(
                          color: ThemeColors.whiteColor.withValues(alpha: 0.05),
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.only(
                        start: context.rw(16),
                        end: context.rw(16),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: iconContainerSize,
                            height: iconContainerSize,
                            decoration: BoxDecoration(
                              color: ThemeColors.goldPrimary,
                              borderRadius: BorderRadius.circular(
                                context.rr(_overlayRadius),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: ThemeColors.goldPrimary
                                      .withValues(alpha: 0.2),
                                  blurRadius: 15,
                                ),
                              ],
                            ),
                            child: Icon(
                              icon,
                              size: context.rsp(24),
                              color: ThemeColors.blackColorF1,
                            ),
                          ),
                          SizedBox(width: context.rw(12)),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  actionTitle,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: AppTextStyles.heroActionTitle.copyWith(
                                    fontSize: context.rsp(14),
                                  ),
                                ),
                                SizedBox(height: context.rh(2)),
                                Text(
                                  actionSubtitle,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style:
                                      AppTextStyles.heroActionSubtitle.copyWith(
                                    fontSize: context.rsp(12),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: chevronContainerSize,
                            height: chevronContainerSize,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: ThemeColors.darkSurface
                                  .withValues(alpha: 0.5),
                              border: Border.all(
                                color: ThemeColors.lightBorder
                                    .withValues(alpha: 0.3),
                              ),
                            ),
                            child: ForwardChevronIcon(
                              size: context.rsp(20),
                              color: ThemeColors.goldPrimary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
