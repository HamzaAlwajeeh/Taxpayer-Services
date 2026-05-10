import 'package:flutter/material.dart';
import 'package:tax_payer/Features/Auth/presentation/views/widgets/forgot_password_view_body.dart';
import 'package:tax_payer/core/widgets/gradient_background.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(hasImage: true, child: const ForgotPasswordViewBody()),
    );
  }
}