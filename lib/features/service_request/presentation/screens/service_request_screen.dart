import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nour_store/core/languages/localization_extension.dart';
import 'package:nour_store/core/responsive/responsive_content_shell.dart';
import 'package:nour_store/core/responsive/responsive_sizing.dart';
import 'package:nour_store/core/routes/routes.dart';
import 'package:nour_store/core/theme/theme_colors.dart';
import 'package:nour_store/core/utilies/app_strings.dart';
import 'package:nour_store/core/utilies/app_text_styles.dart';
import 'package:nour_store/core/widgets/directional_icon.dart';
import 'package:nour_store/features/service_request/presentation/widgets/service_request_step_one_widget.dart';
import 'package:nour_store/features/service_request/presentation/widgets/service_request_step_two_widget.dart';
import 'package:nour_store/features/service_request/presentation/widgets/service_request_success_widget.dart';

enum _ServiceRequestStep { one, two, success }

class ServiceRequestScreen extends StatefulWidget {
  const ServiceRequestScreen({super.key});

  @override
  State<ServiceRequestScreen> createState() => _ServiceRequestScreenState();
}

class _ServiceRequestScreenState extends State<ServiceRequestScreen> {
  final _formKey = GlobalKey<FormState>();
  final _projectTitleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _budgetController = TextEditingController();
  final _startDateController = TextEditingController();
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _contactDescriptionController = TextEditingController();

  DateTime? _startDate;
  _ServiceRequestStep _step = _ServiceRequestStep.one;

  @override
  void dispose() {
    _projectTitleController.dispose();
    _descriptionController.dispose();
    _budgetController.dispose();
    _startDateController.dispose();
    _fullNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _contactDescriptionController.dispose();
    super.dispose();
  }

  void _goToStepOne() {
    setState(() => _step = _ServiceRequestStep.one);
  }

  void _goToStepTwo() {
    final isValid = _formKey.currentState?.validate() ?? false;
    if (!isValid) return;
    setState(() => _step = _ServiceRequestStep.two);
  }

  void _submitRequest() {
    final isValid = _formKey.currentState?.validate() ?? false;
    if (!isValid) return;
    setState(() => _step = _ServiceRequestStep.success);
  }

  void _backHome() {
    Navigator.pushNamedAndRemoveUntil(
      context,
      Routes.servicesHome,
      (route) => false,
    );
  }

  void _onHeaderBack() {
    switch (_step) {
      case _ServiceRequestStep.one:
        Navigator.of(context).pop();
      case _ServiceRequestStep.two:
        _goToStepOne();
      case _ServiceRequestStep.success:
        _backHome();
    }
  }

  Future<void> _pickStartDate() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: _startDate ?? now,
      firstDate: DateTime(now.year, now.month, now.day),
      lastDate: DateTime(now.year + 5),
    );
    if (picked == null || !mounted) return;

    final locale = Localizations.localeOf(context).toString();
    setState(() {
      _startDate = picked;
      _startDateController.text = DateFormat.yMMMd(locale).format(picked);
    });
  }


  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final background =
        isDark ? ThemeColors.darkBackground : ThemeColors.lightBackground;
    final textPrimary =
        isDark ? ThemeColors.darkTextPrimary : ThemeColors.lightTextPrimary;
    final dividerColor =
        isDark ? ThemeColors.darkDivider : ThemeColors.lightCardBorder;

    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: Column(
          children: [
            _ServiceRequestHeader(
              textColor: textPrimary,
              onBack: _onHeaderBack,
            ),
            Divider(height: 1, thickness: 1, color: dividerColor),
            Expanded(
              child: ResponsiveContentShell(
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    padding: EdgeInsets.only(
                      top: context.rh(16),
                      bottom: context.rh(24),
                    ),
                    child: switch (_step) {
                      _ServiceRequestStep.one => Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            ServiceRequestStepOneWidget(
                              projectTitleController: _projectTitleController,
                              descriptionController: _descriptionController,
                              budgetController: _budgetController,
                              startDateController: _startDateController,
                              onPickStartDate: _pickStartDate,
                            ),
                            SizedBox(height: context.rh(22)),
                            _NextButton(onPressed: _goToStepTwo),
                          ],
                        ),
                      _ServiceRequestStep.two => Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            ServiceRequestStepTwoWidget(
                              fullNameController: _fullNameController,
                              emailController: _emailController,
                              phoneController: _phoneController,
                              descriptionController:
                                  _contactDescriptionController,
                              budget: _budgetController.text.trim(),
                              startDate: _startDateController.text.trim(),
                              onEdit: _goToStepOne,
                            ),
                            SizedBox(height: context.rh(22)),
                            _StepTwoActions(
                              onPrevious: _goToStepOne,
                              onSend: _submitRequest,
                            ),
                          ],
                        ),
                      _ServiceRequestStep.success => ServiceRequestSuccessWidget(
                          onBackHome: _backHome,
                        ),
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ServiceRequestHeader extends StatelessWidget {
  const _ServiceRequestHeader({
    required this.textColor,
    required this.onBack,
  });

  final Color textColor;
  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
        start: context.rw(4),
        end: context.rw(12),
        top: context.rh(4),
        bottom: context.rh(8),
      ),
      child: SizedBox(
        height: context.rh(40),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: IconButton(
                visualDensity: VisualDensity.compact,
                onPressed: onBack,
                icon: BackArrowIcon(
                  color: textColor,
                  size: 22,
                ),
              ),
            ),
            Text(
              context.tr(AppStrings.serviceRequestTitle),
              style: AppTextStyles.sectionTitle.copyWith(
                color: textColor,
                fontSize: context.rsp(20),
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _NextButton extends StatelessWidget {
  const _NextButton({required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: SizedBox(
        height: context.rh(46),
        width: context.rw(180),
        child: FilledButton(
          onPressed: onPressed,
          style: FilledButton.styleFrom(
            backgroundColor: ThemeColors.goldPrimary,
            foregroundColor: ThemeColors.blackColorF1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(context.rr(12)),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                context.tr(AppStrings.next),
                style: AppTextStyles.servicesCraftsmanName.copyWith(
                  color: ThemeColors.blackColorF1,
                  fontSize: context.rsp(16),
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(width: context.rw(6)),
              const ForwardChevronIcon(
                color: ThemeColors.blackColorF1,
                size: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _StepTwoActions extends StatelessWidget {
  const _StepTwoActions({
    required this.onPrevious,
    required this.onSend,
  });

  final VoidCallback onPrevious;
  final VoidCallback onSend;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: context.rh(46),
            child: OutlinedButton(
              onPressed: onPrevious,
              style: OutlinedButton.styleFrom(
                foregroundColor: ThemeColors.goldPrimary,
                side: const BorderSide(color: ThemeColors.goldPrimary),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(context.rr(12)),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const _BackChevronIcon(
                    color: ThemeColors.goldPrimary,
                    size: 18,
                  ),
                  SizedBox(width: context.rw(4)),
                  Text(
                    context.tr(AppStrings.serviceRequestPrevious),
                    style: AppTextStyles.servicesCraftsmanName.copyWith(
                      color: ThemeColors.goldPrimary,
                      fontSize: context.rsp(14),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(width: context.rw(10)),
        Expanded(
          flex: 2,
          child: SizedBox(
            height: context.rh(46),
            child: FilledButton(
              onPressed: onSend,
              style: FilledButton.styleFrom(
                backgroundColor: ThemeColors.goldPrimary,
                foregroundColor: ThemeColors.blackColorF1,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(context.rr(12)),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    context.tr(AppStrings.serviceRequestSendNow),
                    style: AppTextStyles.servicesCraftsmanName.copyWith(
                      color: ThemeColors.blackColorF1,
                      fontSize: context.rsp(14),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(width: context.rw(6)),
                  Icon(
                    Icons.send_outlined,
                    color: ThemeColors.blackColorF1,
                    size: context.rsp(16),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _BackChevronIcon extends StatelessWidget {
  const _BackChevronIcon({
    required this.color,
    required this.size,
  });

  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Icon(
      context.isRtl ? Icons.chevron_right_rounded : Icons.chevron_left_rounded,
      size: size,
      color: color,
    );
  }
}
