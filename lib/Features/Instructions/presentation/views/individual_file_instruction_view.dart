import 'package:flutter/material.dart';
import 'package:tax_payer/Features/Instructions/presentation/views/widgets/instruction_detail_card.dart';
import 'package:tax_payer/Features/Instructions/presentation/views/widgets/instructions_hero_card.dart';
import 'package:tax_payer/core/constants/app_spacing.dart';
import 'package:tax_payer/core/utils/app_colors.dart';
import 'package:tax_payer/core/widgets/custom_app_bar.dart';
import 'package:tax_payer/core/widgets/gradient_background.dart';
import 'package:tax_payer/generated/l10n.dart';

class IndividualFileInstructionView extends StatelessWidget {
  const IndividualFileInstructionView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);
    final color = AppColors.customGreen();

    return Scaffold(
      appBar: CustomAppBar(title: l10n.IndividualFileRequirements),
      body: GradientBackground(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(AppSpacing.s16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InstructionsHeroCard(
                title: l10n.IndividualFile,
                description: l10n.IndividualFileDesc,
                icon: Icons.person_rounded,
                color: color,
              ),
              const SizedBox(height: AppSpacing.s24),
              InstructionDetailCard(
                sectionTitle: l10n.RequiredDocuments,
                sectionIcon: Icons.folder_open_rounded,
                items: [
                  l10n.IndividualReq1,
                  l10n.IndividualReq2,
                  l10n.IndividualReq3,
                  l10n.IndividualReq4,
                  l10n.IndividualReq5,
                  l10n.IndividualReq6,
                ],
                note: l10n.IndividualNote,
                accentColor: color,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
