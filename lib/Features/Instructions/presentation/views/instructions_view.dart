import 'package:flutter/material.dart';
import 'package:tax_payer/Features/Instructions/presentation/views/widgets/instructions_view_body.dart';
import 'package:tax_payer/core/widgets/gradient_background.dart';

class InstructionsView extends StatelessWidget {
  const InstructionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(child: const InstructionsViewBody()),
    );
  }
}
