import 'package:flutter/material.dart';
import 'package:tax_payer/Features/Auth/presentation/views/widgets/verify_code_view_body.dart';
import 'package:tax_payer/core/widgets/gradient_background.dart';

class VerifyCodeView extends StatelessWidget {
  const VerifyCodeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        hasImage: true,
        child: const VerifyCodeViewBody(),
      ),
    );
  }
}
