import 'package:flutter/material.dart';
import 'package:tax_payer/Features/Instructions/presentation/views/widgets/instruction_detail_card.dart';
import 'package:tax_payer/Features/Instructions/presentation/views/widgets/instructions_hero_card.dart';
import 'package:tax_payer/core/constants/app_spacing.dart';
import 'package:tax_payer/core/utils/app_colors.dart';
import 'package:tax_payer/core/widgets/custom_app_bar.dart';
import 'package:tax_payer/core/widgets/gradient_background.dart';
import 'package:tax_payer/generated/l10n.dart';

class CharitableCompanyFileInstructionView extends StatelessWidget {
  const CharitableCompanyFileInstructionView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);
    final color = AppColors.customOrange();

    return Scaffold(
      appBar: CustomAppBar(title: l10n.CharitableCompanyFileRequirements),
      body: GradientBackground(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(AppSpacing.s16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InstructionsHeroCard(
                title: l10n.CharitableCompanyFile,
                description: l10n.CharitableCompanyFileDesc,
                icon: Icons.volunteer_activism_rounded,
                color: color,
              ),
              const SizedBox(height: AppSpacing.s24),
              InstructionDetailCard(
                sectionTitle: l10n.RequiredDocuments,
                sectionIcon: Icons.folder_open_rounded,
                items: [
                  l10n.CharitableReq1,
                  l10n.CharitableReq2,
                  l10n.CharitableReq3,
                  l10n.CharitableReq4,
                  l10n.CharitableReq5,
                  l10n.CharitableReq6,
                ],
                note: l10n.CharitableNote,
                accentColor: color,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
