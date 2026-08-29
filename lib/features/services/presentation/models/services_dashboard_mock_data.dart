import 'package:flutter/material.dart';
import 'package:nour_store/core/utilies/app_assets.dart';
import 'package:nour_store/core/utilies/app_strings.dart';

class HeroBannerItem {
  const HeroBannerItem({
    required this.imageAssets,
    required this.headlineKey,
    required this.subtitleKey,
  });

  final List<String> imageAssets;
  final String headlineKey;
  final String subtitleKey;
}

class ServiceCategoryItem {
  const ServiceCategoryItem({
    required this.id,
    required this.labelKey,
    required this.icon,
  });

  final String id;
  final String labelKey;
  final IconData icon;
}

class FeaturedCraftsmanItem {
  const FeaturedCraftsmanItem({
    required this.id,
    required this.nameKey,
    required this.titleKey,
    required this.photoAsset,
  });

  final String id;
  final String nameKey;
  final String titleKey;
  final String photoAsset;
}

class ServicesDashboardMockData {
  ServicesDashboardMockData._();

  static const heroBanners = [
    HeroBannerItem(
      imageAssets: [
        AppAssets.servicesHeroWorker1,
        AppAssets.servicesHeroWorker2,
        AppAssets.servicesHeroWorker3,
        AppAssets.servicesHeroWorker4,
      ],
      headlineKey: AppStrings.servicesHeroHeadline,
      subtitleKey: AppStrings.servicesHeroSubtitle,
    ),
    HeroBannerItem(
      imageAssets: [
        AppAssets.servicesHeroWorker2,
        AppAssets.servicesHeroWorker3,
        AppAssets.servicesHeroWorker4,
        AppAssets.servicesHeroWorker1,
      ],
      headlineKey: AppStrings.servicesHeroHeadline,
      subtitleKey: AppStrings.servicesHeroSubtitle,
    ),
    HeroBannerItem(
      imageAssets: [
        AppAssets.servicesHeroWorker3,
        AppAssets.servicesHeroWorker4,
        AppAssets.servicesHeroWorker1,
        AppAssets.servicesHeroWorker2,
      ],
      headlineKey: AppStrings.servicesHeroHeadline,
      subtitleKey: AppStrings.servicesHeroSubtitle,
    ),
  ];

  static const categories = [
    ServiceCategoryItem(
      id: 'advertising',
      labelKey: AppStrings.servicesCategoryAdvertising,
      icon: Icons.campaign_outlined,
    ),
    ServiceCategoryItem(
      id: 'architect',
      labelKey: AppStrings.servicesCategoryArchitect,
      icon: Icons.architecture_outlined,
    ),
    ServiceCategoryItem(
      id: 'carpentry',
      labelKey: AppStrings.servicesCategoryCarpentry,
      icon: Icons.chair_outlined,
    ),
    ServiceCategoryItem(
      id: 'plumbing',
      labelKey: AppStrings.servicesCategoryPlumbing,
      icon: Icons.plumbing_outlined,
    ),
    ServiceCategoryItem(
      id: 'electrical',
      labelKey: AppStrings.servicesCategoryElectrical,
      icon: Icons.electrical_services_outlined,
    ),
  ];

  static const featuredCraftsmen = [
    FeaturedCraftsmanItem(
      id: 'craftsman_1',
      nameKey: AppStrings.servicesCraftsman1Name,
      titleKey: AppStrings.servicesCraftsman1Title,
      photoAsset: AppAssets.servicesCraftsman1,
    ),
    FeaturedCraftsmanItem(
      id: 'craftsman_2',
      nameKey: AppStrings.servicesCraftsman2Name,
      titleKey: AppStrings.servicesCraftsman2Title,
      photoAsset: AppAssets.servicesCraftsman2,
    ),
    FeaturedCraftsmanItem(
      id: 'craftsman_3',
      nameKey: AppStrings.servicesCraftsman3Name,
      titleKey: AppStrings.servicesCraftsman3Title,
      photoAsset: AppAssets.servicesCraftsman3,
    ),
  ];
}
