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

class CategorySubcategoryItem {
  const CategorySubcategoryItem({
    required this.id,
    required this.labelKey,
  });

  final String id;
  final String labelKey;
}

class FeaturedCraftsmanItem {
  const FeaturedCraftsmanItem({
    required this.id,
    required this.nameKey,
    required this.titleKey,
    required this.photoAsset,
    this.subcategoryIds = const ['all'],
  });

  final String id;
  final String nameKey;
  final String titleKey;
  final String photoAsset;
  final List<String> subcategoryIds;
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
      id: 'interior_designer',
      labelKey: AppStrings.servicesCategoryInteriorDesigner,
      icon: Icons.design_services_outlined,
    ),
    ServiceCategoryItem(
      id: 'electrical',
      labelKey: AppStrings.servicesCategoryElectrical,
      icon: Icons.electrical_services_outlined,
    ),
    ServiceCategoryItem(
      id: 'contracting',
      labelKey: AppStrings.servicesCategoryContracting,
      icon: Icons.construction_outlined,
    ),
    ServiceCategoryItem(
      id: 'painting',
      labelKey: AppStrings.servicesCategoryPainting,
      icon: Icons.format_paint_outlined,
    ),
    ServiceCategoryItem(
      id: 'plumbing',
      labelKey: AppStrings.servicesCategoryPlumbing,
      icon: Icons.plumbing_outlined,
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

  static const _allTab = CategorySubcategoryItem(
    id: 'all',
    labelKey: AppStrings.servicesSubcategoryAll,
  );

  static const _carpentrySubcategories = [
    _allTab,
    CategorySubcategoryItem(
      id: 'furniture',
      labelKey: AppStrings.servicesSubcategoryFurniture,
    ),
    CategorySubcategoryItem(
      id: 'office',
      labelKey: AppStrings.servicesSubcategoryOffice,
    ),
    CategorySubcategoryItem(
      id: 'installation',
      labelKey: AppStrings.servicesSubcategoryInstallation,
    ),
    CategorySubcategoryItem(
      id: 'repair',
      labelKey: AppStrings.servicesSubcategoryRepair,
    ),
  ];

  static const _advertisingSubcategories = [
    _allTab,
    CategorySubcategoryItem(
      id: 'design',
      labelKey: AppStrings.servicesSubcategoryDesign,
    ),
    CategorySubcategoryItem(
      id: 'printing',
      labelKey: AppStrings.servicesSubcategoryPrinting,
    ),
    CategorySubcategoryItem(
      id: 'social_media',
      labelKey: AppStrings.servicesSubcategorySocialMedia,
    ),
    CategorySubcategoryItem(
      id: 'video',
      labelKey: AppStrings.servicesSubcategoryVideo,
    ),
  ];

  static const _architectSubcategories = [
    _allTab,
    CategorySubcategoryItem(
      id: 'design',
      labelKey: AppStrings.servicesSubcategoryDesign,
    ),
    CategorySubcategoryItem(
      id: 'supervision',
      labelKey: AppStrings.servicesSubcategorySupervision,
    ),
    CategorySubcategoryItem(
      id: 'blueprints',
      labelKey: AppStrings.servicesSubcategoryBlueprints,
    ),
    CategorySubcategoryItem(
      id: 'consultation',
      labelKey: AppStrings.servicesSubcategoryConsultation,
    ),
  ];

  static const _interiorDesignerSubcategories = [
    _allTab,
    CategorySubcategoryItem(
      id: 'interior_design',
      labelKey: AppStrings.servicesSubcategoryInteriorDesign,
    ),
    CategorySubcategoryItem(
      id: 'finishing',
      labelKey: AppStrings.servicesSubcategoryFinishing,
    ),
    CategorySubcategoryItem(
      id: 'consultation',
      labelKey: AppStrings.servicesSubcategoryConsultation,
    ),
    CategorySubcategoryItem(
      id: '3d',
      labelKey: AppStrings.servicesSubcategory3d,
    ),
  ];

  static const _electricalSubcategories = [
    _allTab,
    CategorySubcategoryItem(
      id: 'installation',
      labelKey: AppStrings.servicesSubcategoryInstallation,
    ),
    CategorySubcategoryItem(
      id: 'maintenance',
      labelKey: AppStrings.servicesSubcategoryMaintenance,
    ),
    CategorySubcategoryItem(
      id: 'wiring',
      labelKey: AppStrings.servicesSubcategoryWiring,
    ),
    CategorySubcategoryItem(
      id: 'emergency',
      labelKey: AppStrings.servicesSubcategoryEmergency,
    ),
  ];

  static const _contractingSubcategories = [
    _allTab,
    CategorySubcategoryItem(
      id: 'building',
      labelKey: AppStrings.servicesSubcategoryBuilding,
    ),
    CategorySubcategoryItem(
      id: 'renovation',
      labelKey: AppStrings.servicesSubcategoryRenovation,
    ),
    CategorySubcategoryItem(
      id: 'finishing',
      labelKey: AppStrings.servicesSubcategoryFinishing,
    ),
    CategorySubcategoryItem(
      id: 'maintenance',
      labelKey: AppStrings.servicesSubcategoryMaintenance,
    ),
  ];

  static const _paintingSubcategories = [
    _allTab,
    CategorySubcategoryItem(
      id: 'paint',
      labelKey: AppStrings.servicesSubcategoryPaint,
    ),
    CategorySubcategoryItem(
      id: 'decor',
      labelKey: AppStrings.servicesSubcategoryDecor,
    ),
    CategorySubcategoryItem(
      id: 'wallpaper',
      labelKey: AppStrings.servicesSubcategoryWallpaper,
    ),
    CategorySubcategoryItem(
      id: 'renovation',
      labelKey: AppStrings.servicesSubcategoryRenovation,
    ),
  ];

  static const _plumbingSubcategories = [
    _allTab,
    CategorySubcategoryItem(
      id: 'installation',
      labelKey: AppStrings.servicesSubcategoryInstallation,
    ),
    CategorySubcategoryItem(
      id: 'maintenance',
      labelKey: AppStrings.servicesSubcategoryMaintenance,
    ),
    CategorySubcategoryItem(
      id: 'leak',
      labelKey: AppStrings.servicesSubcategoryLeak,
    ),
    CategorySubcategoryItem(
      id: 'heaters',
      labelKey: AppStrings.servicesSubcategoryHeaters,
    ),
  ];

  static const Map<String, List<CategorySubcategoryItem>>
      subcategoriesByCategoryId = {
    'carpentry': _carpentrySubcategories,
    'advertising': _advertisingSubcategories,
    'architect': _architectSubcategories,
    'interior_designer': _interiorDesignerSubcategories,
    'electrical': _electricalSubcategories,
    'contracting': _contractingSubcategories,
    'painting': _paintingSubcategories,
    'plumbing': _plumbingSubcategories,
  };

  static const _carpentryProviders = [
    FeaturedCraftsmanItem(
      id: 'craftsman_carpentry_1',
      nameKey: AppStrings.servicesCraftsman2Name,
      titleKey: AppStrings.servicesCraftsman2Title,
      photoAsset: AppAssets.servicesCraftsman2,
      subcategoryIds: ['all', 'furniture', 'installation'],
    ),
    FeaturedCraftsmanItem(
      id: 'craftsman_carpentry_2',
      nameKey: AppStrings.servicesCraftsman1Name,
      titleKey: AppStrings.servicesCraftsman2Title,
      photoAsset: AppAssets.servicesCraftsman1,
      subcategoryIds: ['all', 'office', 'furniture'],
    ),
    FeaturedCraftsmanItem(
      id: 'craftsman_carpentry_3',
      nameKey: AppStrings.servicesCraftsman3Name,
      titleKey: AppStrings.servicesCraftsman2Title,
      photoAsset: AppAssets.servicesCraftsman3,
      subcategoryIds: ['all', 'repair', 'installation'],
    ),
    FeaturedCraftsmanItem(
      id: 'craftsman_carpentry_4',
      nameKey: AppStrings.servicesCraftsman2Name,
      titleKey: AppStrings.servicesCraftsman2Title,
      photoAsset: AppAssets.servicesCraftsman2,
      subcategoryIds: ['all', 'furniture', 'repair'],
    ),
  ];

  static const _defaultProviders = [
    FeaturedCraftsmanItem(
      id: 'craftsman_1',
      nameKey: AppStrings.servicesCraftsman1Name,
      titleKey: AppStrings.servicesCraftsman1Title,
      photoAsset: AppAssets.servicesCraftsman1,
      subcategoryIds: [
        'all',
        'design',
        'printing',
        'supervision',
        'interior_design',
        'installation',
        'building',
        'paint',
        'maintenance',
      ],
    ),
    FeaturedCraftsmanItem(
      id: 'craftsman_2',
      nameKey: AppStrings.servicesCraftsman2Name,
      titleKey: AppStrings.servicesCraftsman2Title,
      photoAsset: AppAssets.servicesCraftsman2,
      subcategoryIds: [
        'all',
        'social_media',
        'blueprints',
        'finishing',
        'wiring',
        'renovation',
        'decor',
        'leak',
        'consultation',
      ],
    ),
    FeaturedCraftsmanItem(
      id: 'craftsman_3',
      nameKey: AppStrings.servicesCraftsman3Name,
      titleKey: AppStrings.servicesCraftsman3Title,
      photoAsset: AppAssets.servicesCraftsman3,
      subcategoryIds: [
        'all',
        'video',
        'consultation',
        '3d',
        'emergency',
        'maintenance',
        'wallpaper',
        'heaters',
      ],
    ),
  ];

  static List<CategorySubcategoryItem> subcategoriesFor(String categoryId) {
    return subcategoriesByCategoryId[categoryId] ?? const [_allTab];
  }

  static List<FeaturedCraftsmanItem> providersFor({
    required String categoryId,
    required String subcategoryId,
  }) {
    final providers = switch (categoryId) {
      'carpentry' => _carpentryProviders,
      _ => _defaultProviders,
    };

    if (subcategoryId == 'all') {
      return providers;
    }

    return providers
        .where((provider) => provider.subcategoryIds.contains(subcategoryId))
        .toList(growable: false);
  }
}
