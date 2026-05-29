import 'package:flutter/material.dart';
import 'package:tax_payer/Features/Profile/presentation/views/widgets/privacy_and_security_view_body.dart';
import 'package:tax_payer/core/utils/app_colors.dart';
import 'package:tax_payer/core/widgets/custom_app_bar.dart';
import 'package:tax_payer/generated/l10n.dart';

class PrivacyAndSecurityView extends StatelessWidget {
  const PrivacyAndSecurityView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: S.of(context).SecurityAndPrivacy,
        color: AppColors.primaryColor(context),
      ),
      body: const PrivacyAndSecurityViewBody(),
    );
  }
}
