import 'package:flutter/material.dart';
import 'package:nour_store/core/widgets/coming_soon_content.dart';
import 'package:nour_store/features/services/presentation/widgets/services_dashboard_tab.dart';
import 'package:nour_store/features/services/presentation/widgets/services_floating_nav_bar.dart';

class ServicesHomeScreen extends StatefulWidget {
  const ServicesHomeScreen({super.key});

  @override
  State<ServicesHomeScreen> createState() => _ServicesHomeScreenState();
}

class _ServicesHomeScreenState extends State<ServicesHomeScreen> {
  int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            IndexedStack(
              index: _selectedTab,
              children: const [
                ServicesDashboardTab(),
                ResponsiveComingSoonTab(icon: Icons.grid_view_rounded),
                ResponsiveComingSoonTab(icon: Icons.assignment_outlined),
                ResponsiveComingSoonTab(icon: Icons.person_outline),
              ],
            ),
            PositionedDirectional(
              start: 0,
              end: 0,
              bottom: 0,
              child: ServicesFloatingNavBar(
                selectedIndex: _selectedTab,
                onItemSelected: (index) => setState(() => _selectedTab = index),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ResponsiveComingSoonTab extends StatelessWidget {
  const ResponsiveComingSoonTab({
    super.key,
    required this.icon,
  });

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ComingSoonContent(
        icon: icon,
      ),
    );
  }
}
