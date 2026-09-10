import 'package:flutter/material.dart';
import 'package:nour_store/core/languages/localization_extension.dart';
import 'package:nour_store/core/responsive/responsive_content_shell.dart';
import 'package:nour_store/core/responsive/responsive_sizing.dart';
import 'package:nour_store/core/routes/routes.dart';
import 'package:nour_store/core/theme/theme_colors.dart';
import 'package:nour_store/core/utilies/app_strings.dart';
import 'package:nour_store/core/utilies/app_text_styles.dart';
import 'package:nour_store/features/services/presentation/models/services_orders_mock_data.dart';
import 'package:nour_store/features/services/presentation/widgets/order_card_widget.dart';
import 'package:nour_store/features/services/presentation/widgets/orders_status_filter_bar.dart';

class ServicesOrdersTab extends StatefulWidget {
  const ServicesOrdersTab({super.key});

  @override
  State<ServicesOrdersTab> createState() => _ServicesOrdersTabState();
}

class _ServicesOrdersTabState extends State<ServicesOrdersTab> {
  late String _selectedStatusId;

  @override
  void initState() {
    super.initState();
    _selectedStatusId = ServicesOrdersMockData.statusFilters.first.id;
  }

  OrderStatus get _selectedStatus {
    return ServicesOrdersMockData.statusFilters
        .firstWhere((item) => item.id == _selectedStatusId)
        .status;
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textPrimary =
        isDark ? ThemeColors.darkTextPrimary : ThemeColors.lightTextPrimary;
    final orders = ServicesOrdersMockData.ordersFor(_selectedStatus);

    return ResponsiveContentShell(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            context.tr(AppStrings.ordersTrackingTitle),
            style: AppTextStyles.sectionTitle.copyWith(
              color: textPrimary,
              fontSize: context.rsp(20),
            ),
          ),
          SizedBox(height: context.rh(12)),
          OrdersStatusFilterBar(
            filters: ServicesOrdersMockData.statusFilters,
            selectedId: _selectedStatusId,
            onSelected: (id) => setState(() => _selectedStatusId = id),
          ),
          SizedBox(height: context.rh(16)),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.only(bottom: context.rh(88)),
              itemCount: orders.length,
              separatorBuilder: (_, _) => SizedBox(height: context.rh(12)),
              itemBuilder: (context, index) {
                final order = orders[index];
                return OrderCardWidget(
                  key: ValueKey('order_card_${order.id}'),
                  order: order,
                  onViewDetails: () => Navigator.pushNamed(
                    context,
                    Routes.orderDetails,
                    arguments: order,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
