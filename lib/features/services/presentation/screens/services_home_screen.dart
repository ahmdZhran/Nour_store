import 'package:flutter/material.dart';
import 'package:nour_store/core/languages/localization_extension.dart';
import 'package:nour_store/core/responsive/responsive_content_shell.dart';
import 'package:nour_store/core/utilies/app_strings.dart';
import 'package:nour_store/core/widgets/coming_soon_content.dart';

class ServicesHomeScreen extends StatelessWidget {
  const ServicesHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.tr(AppStrings.homeServices)),
      ),
      body: const ResponsiveContentShell(
        alignment: Alignment.center,
        child: ComingSoonContent(
          icon: Icons.home_repair_service_outlined,
        ),
      ),
    );
  }
}
