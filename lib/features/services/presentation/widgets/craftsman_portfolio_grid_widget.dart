import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:nour_store/core/responsive/responsive_sizing.dart';
import 'package:nour_store/core/theme/theme_colors.dart';

class CraftsmanPortfolioGridWidget extends StatelessWidget {
  const CraftsmanPortfolioGridWidget({
    super.key,
    required this.imageAssets,
  });

  final List<String> imageAssets;

  static const double _gridGap = 12;
  static const double _imageRadius = 12;

  @override
  Widget build(BuildContext context) {
    if (imageAssets.length < 3) {
      return const SizedBox.shrink();
    }

    final radius = BorderRadius.circular(context.rr(_imageRadius));
    final gap = context.rw(_gridGap);

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 1,
            child: _PortfolioImage(
              asset: imageAssets[0],
              radius: radius,
            ),
          ),
          SizedBox(width: gap),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Expanded(
                  child: _PortfolioImage(
                    asset: imageAssets[1],
                    radius: radius,
                  ),
                ),
                SizedBox(height: gap),
                Expanded(
                  child: _PortfolioImage(
                    asset: imageAssets[2],
                    radius: radius,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _PortfolioImage extends StatelessWidget {
  const _PortfolioImage({
    required this.asset,
    required this.radius,
  });

  final String asset;
  final BorderRadius radius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: radius,
      child: AspectRatio(
        aspectRatio: 1,
        child: Image.asset(
          asset,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
