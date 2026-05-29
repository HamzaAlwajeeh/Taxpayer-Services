import 'package:flutter/material.dart';
import 'package:tax_payer/Features/Instructions/data/models/instruction_detail_model.dart';
import 'package:tax_payer/Features/Instructions/presentation/views/widgets/instruction_detail_card.dart';
import 'package:tax_payer/Features/Instructions/presentation/views/widgets/instructions_hero_card.dart';
import 'package:tax_payer/core/constants/app_spacing.dart';
import 'package:tax_payer/core/utils/app_colors.dart';
import 'package:tax_payer/core/widgets/custom_app_bar.dart';
import 'package:tax_payer/generated/l10n.dart';

class InstructionDetailView extends StatelessWidget {
  const InstructionDetailView({super.key, required this.model});

  final InstructionDetailModel model;

  @override
  Widget build(BuildContext context) {
    final color = model.accentColor ?? AppColors.primaryColor(context);

    return Scaffold(
      appBar: CustomAppBar(title: model.title, color: color),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(AppSpacing.s16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InstructionsHeroCard(
              title: model.title,
              description: model.headerDescription,
              icon: model.headerIcon,
              color: color,
            ),
            const SizedBox(height: AppSpacing.s24),
            InstructionDetailCard(
              sectionTitle: S.of(context).StepsToFollow,
              sectionIcon: Icons.checklist_rounded,
              items: model.steps,
              note: model.note,
              accentColor: color,
            ),
          ],
        ),
      ),
    );
  }
}
