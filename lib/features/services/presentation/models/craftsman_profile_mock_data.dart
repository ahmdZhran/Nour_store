import 'package:nour_store/core/utilies/app_assets.dart';
import 'package:nour_store/core/utilies/app_strings.dart';
import 'package:nour_store/features/services/presentation/models/services_dashboard_mock_data.dart';

class CraftsmanProfileData {
  const CraftsmanProfileData({
    required this.id,
    required this.nameKey,
    required this.titleKey,
    required this.photoAsset,
    required this.specialtyKey,
    required this.locationKey,
    required this.memberSinceKey,
    required this.aboutKey,
    required this.portfolioAssets,
    required this.ctaKey,
  });

  final String id;
  final String nameKey;
  final String titleKey;
  final String photoAsset;
  final String specialtyKey;
  final String locationKey;
  final String memberSinceKey;
  final String aboutKey;
  final List<String> portfolioAssets;
  final String ctaKey;
}

class CraftsmanProfileMockData {
  CraftsmanProfileMockData._();

  static const _profiles = <String, CraftsmanProfileData>{
    'craftsman_1': CraftsmanProfileData(
      id: 'craftsman_1',
      nameKey: AppStrings.servicesCraftsman1Name,
      titleKey: AppStrings.servicesCraftsman1Title,
      photoAsset: AppAssets.servicesCraftsman1,
      specialtyKey: AppStrings.craftsmanProfileSpecialtyFurniture,
      locationKey: AppStrings.craftsmanProfileLocation,
      memberSinceKey: AppStrings.craftsmanProfileMemberSince,
      aboutKey: AppStrings.craftsmanProfileAboutAhmed,
      portfolioAssets: [
        AppAssets.craftsmanProfilePortfolio1,
        AppAssets.craftsmanProfilePortfolio2,
        AppAssets.craftsmanProfilePortfolio3,
      ],
      ctaKey: AppStrings.craftsmanProfileRequestQuote,
    ),
    'craftsman_2': CraftsmanProfileData(
      id: 'craftsman_2',
      nameKey: AppStrings.servicesCraftsman2Name,
      titleKey: AppStrings.servicesCraftsman2Title,
      photoAsset: AppAssets.servicesCraftsman2,
      specialtyKey: AppStrings.craftsmanProfileSpecialtyCarpentry,
      locationKey: AppStrings.craftsmanProfileLocation,
      memberSinceKey: AppStrings.craftsmanProfileMemberSince,
      aboutKey: AppStrings.craftsmanProfileAboutKhaled,
      portfolioAssets: [
        AppAssets.craftsmanProfilePortfolio2,
        AppAssets.craftsmanProfilePortfolio3,
        AppAssets.craftsmanProfilePortfolio1,
      ],
      ctaKey: AppStrings.craftsmanProfileRequestQuote,
    ),
    'craftsman_3': CraftsmanProfileData(
      id: 'craftsman_3',
      nameKey: AppStrings.servicesCraftsman3Name,
      titleKey: AppStrings.servicesCraftsman3Title,
      photoAsset: AppAssets.servicesCraftsman3,
      specialtyKey: AppStrings.craftsmanProfileSpecialtyElectrical,
      locationKey: AppStrings.craftsmanProfileLocation,
      memberSinceKey: AppStrings.craftsmanProfileMemberSince,
      aboutKey: AppStrings.craftsmanProfileAboutOmar,
      portfolioAssets: [
        AppAssets.craftsmanProfilePortfolio3,
        AppAssets.craftsmanProfilePortfolio1,
        AppAssets.craftsmanProfilePortfolio2,
      ],
      ctaKey: AppStrings.craftsmanProfileRequestQuote,
    ),
  };

  static CraftsmanProfileData fromFeaturedCraftsman(FeaturedCraftsmanItem item) {
    return _profiles[item.id] ??
        CraftsmanProfileData(
          id: item.id,
          nameKey: item.nameKey,
          titleKey: item.titleKey,
          photoAsset: item.photoAsset,
          specialtyKey: AppStrings.craftsmanProfileSpecialtyFurniture,
          locationKey: AppStrings.craftsmanProfileLocation,
          memberSinceKey: AppStrings.craftsmanProfileMemberSince,
          aboutKey: AppStrings.craftsmanProfileAboutAhmed,
          portfolioAssets: const [
            AppAssets.craftsmanProfilePortfolio1,
            AppAssets.craftsmanProfilePortfolio2,
            AppAssets.craftsmanProfilePortfolio3,
          ],
          ctaKey: AppStrings.craftsmanProfileRequestQuote,
        );
  }
}
