import 'package:flutter/material.dart';
import 'package:tax_payer/Features/Instructions/presentation/views/widgets/instruction_detail_card.dart';
import 'package:tax_payer/Features/Instructions/presentation/views/widgets/instructions_hero_card.dart';
import 'package:tax_payer/core/constants/app_spacing.dart';
import 'package:tax_payer/core/utils/app_colors.dart';
import 'package:tax_payer/core/widgets/custom_app_bar.dart';
import 'package:tax_payer/core/widgets/gradient_background.dart';
import 'package:tax_payer/generated/l10n.dart';

class CompanyFileInstructionView extends StatelessWidget {
  const CompanyFileInstructionView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);
    final color = AppColors.customBlue();

    return Scaffold(
      appBar: CustomAppBar(title: l10n.CompanyFileRequirements),
      body: GradientBackground(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(AppSpacing.s16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InstructionsHeroCard(
                title: l10n.CompanyFile,
                description: l10n.CompanyFileDesc,
                icon: Icons.business_rounded,
                color: color,
              ),
              const SizedBox(height: AppSpacing.s24),
              InstructionDetailCard(
                sectionTitle: l10n.RequiredDocuments,
                sectionIcon: Icons.folder_open_rounded,
                items: [
                  l10n.CompanyReq1,
                  l10n.CompanyReq2,
                  l10n.CompanyReq3,
                  l10n.CompanyReq4,
                  l10n.CompanyReq5,
                  l10n.CompanyReq6,
                  l10n.CompanyReq7,
                ],
                note: l10n.CompanyNote,
                accentColor: color,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
