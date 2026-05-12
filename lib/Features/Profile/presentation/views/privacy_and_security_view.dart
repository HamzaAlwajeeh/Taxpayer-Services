import 'package:flutter/material.dart';
import 'package:tax_payer/Features/Profile/presentation/views/widgets/privacy_and_security_view_body.dart';
import 'package:tax_payer/core/widgets/gradient_background.dart';

class PrivacyAndSecurityView extends StatelessWidget {
  const PrivacyAndSecurityView({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientBackground(child: PrivacyAndSecurityViewBody());
  }
}
