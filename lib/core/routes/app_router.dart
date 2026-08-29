import 'package:flutter/material.dart';
import 'package:nour_store/core/routes/app_page_transitions.dart';
import 'package:nour_store/core/routes/routes.dart';
import 'package:nour_store/features/main_selection/presentation/screens/main_selection_screen.dart';
import 'package:nour_store/features/marketplace/presentation/screens/marketplace_home_screen.dart';
import 'package:nour_store/features/services/presentation/models/craftsman_profile_mock_data.dart';
import 'package:nour_store/features/services/presentation/models/services_dashboard_mock_data.dart';
import 'package:nour_store/features/services/presentation/screens/craftsman_profile_screen.dart';
import 'package:nour_store/features/services/presentation/screens/services_home_screen.dart';
import 'package:nour_store/features/store/presentation/pages/store_home_screen.dart';

class AppRouter {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.mainSelection:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const MainSelectionScreen(),
        );
      case Routes.storeHome:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const StoreHomeScreen(),
        );
      case Routes.servicesHome:
        return AppPageTransitions.fadeSlideUp(
          settings: settings,
          builder: (_) => const ServicesHomeScreen(),
        );
      case Routes.marketplaceHome:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const MarketplaceHomeScreen(),
        );
      case Routes.craftsmanProfile:
        final craftsman = settings.arguments! as FeaturedCraftsmanItem;
        final profile = CraftsmanProfileMockData.fromFeaturedCraftsman(craftsman);
        return AppPageTransitions.heroDetail(
          settings: settings,
          builder: (_) => CraftsmanProfileScreen(profile: profile),
        );
      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const MainSelectionScreen(),
        );
    }
  }
}
