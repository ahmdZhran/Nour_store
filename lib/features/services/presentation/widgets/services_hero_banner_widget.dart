import 'package:flutter/material.dart';
import 'package:nour_store/core/languages/localization_extension.dart';
import 'package:nour_store/core/responsive/responsive_sizing.dart';
import 'package:nour_store/core/theme/theme_colors.dart';
import 'package:nour_store/core/utilies/app_text_styles.dart';
import 'package:nour_store/features/services/presentation/models/services_dashboard_mock_data.dart';

class ServicesHeroBannerWidget extends StatefulWidget {
  const ServicesHeroBannerWidget({
    super.key,
    required this.banners,
  });

  final List<HeroBannerItem> banners;

  @override
  State<ServicesHeroBannerWidget> createState() =>
      _ServicesHeroBannerWidgetState();
}

class _ServicesHeroBannerWidgetState extends State<ServicesHeroBannerWidget> {
  late final PageController _pageController;
  int _currentPage = 0;

  static const double _bannerHeight = 180;
  static const double _borderRadius = 20;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(context.rr(_borderRadius)),
          child: SizedBox(
            height: context.rh(_bannerHeight),
            child: PageView.builder(
              controller: _pageController,
              itemCount: widget.banners.length,
              onPageChanged: (index) => setState(() => _currentPage = index),
              itemBuilder: (context, index) {
                final banner = widget.banners[index];
                return _HeroBannerSlide(banner: banner);
              },
            ),
          ),
        ),
        SizedBox(height: context.rh(16)),
        _PaginationDots(
          count: widget.banners.length,
          currentIndex: _currentPage,
        ),
      ],
    );
  }
}

class _HeroBannerSlide extends StatelessWidget {
  const _HeroBannerSlide({required this.banner});

  final HeroBannerItem banner;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Row(
          children: [
            for (final asset in banner.imageAssets)
              Expanded(
                child: Image.asset(
                  asset,
                  fit: BoxFit.cover,
                  height: double.infinity,
                ),
              ),
          ],
        ),
        DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black.withValues(alpha: 0.0),
                Colors.black.withValues(alpha: 0.4),
                Colors.black.withValues(alpha: 0.9),
              ],
            ),
          ),
        ),
        PositionedDirectional(
          start: context.rw(20),
          end: context.rw(20),
          bottom: context.rh(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                context.tr(banner.headlineKey),
                style: AppTextStyles.heroOverlayTitle.copyWith(
                  fontSize: context.rsp(20),
                ),
              ),
              SizedBox(height: context.rh(4)),
              Text(
                context.tr(banner.subtitleKey),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.heroActionSubtitle.copyWith(
                  fontSize: context.rsp(12),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _PaginationDots extends StatelessWidget {
  const _PaginationDots({
    required this.count,
    required this.currentIndex,
  });

  final int count;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(count, (index) {
        final isActive = index == currentIndex;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: EdgeInsetsDirectional.only(
            end: index == count - 1 ? 0 : context.rw(8),
          ),
          width: isActive ? context.rw(24) : context.rw(6),
          height: context.rh(6),
          decoration: BoxDecoration(
            color: isActive
                ? ThemeColors.goldPrimary
                : ThemeColors.darkCard,
            borderRadius: BorderRadius.circular(context.rr(999)),
          ),
        );
      }),
    );
  }
}
