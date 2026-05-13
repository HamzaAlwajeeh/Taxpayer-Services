import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tax_payer/Features/Instructions/presentation/views/widgets/instruction_section_title.dart';
import 'package:tax_payer/Features/Instructions/presentation/views/widgets/instruction_tile.dart';
import 'package:tax_payer/Features/Instructions/presentation/views/widgets/instructions_header.dart';
import 'package:tax_payer/Features/Profile/presentation/views/widgets/item_card.dart';
import 'package:tax_payer/core/constants/app_spacing.dart';
import 'package:tax_payer/core/routers/route_names.dart';
import 'package:tax_payer/core/utils/app_colors.dart';
import 'package:tax_payer/core/utils/app_images.dart';
import 'package:tax_payer/core/utils/app_text_style.dart';
import 'package:tax_payer/generated/l10n.dart';

class InstructionsViewBody extends StatelessWidget {
  const InstructionsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);

    return SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.s16,
          vertical: AppSpacing.s16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const InstructionsHeader(),
            const SizedBox(height: AppSpacing.s24),
            InstructionSectionTitle(
              title: l10n.FileOpeningRequirements,
              icon: Icons.folder_copy_rounded,
            ),
            const SizedBox(height: AppSpacing.s4),
            Text(
              l10n.FileOpeningRequirementsDesc,
              style: TextStyles.regular14.copyWith(
                color: AppColors.secondaryColor(context),
              ),
            ),
            const SizedBox(height: AppSpacing.s16),
            ItemCard(
              title: l10n.IndividualFile,
              subtitle: l10n.IndividualFileDesc,
              icon: Assets.assetsIconsPersonalcard,
              onTap: () => context.push(RouteNames.individualFileInstruction),
            ),
            const SizedBox(height: AppSpacing.s12),
            ItemCard(
              title: l10n.CompanyFile,
              subtitle: l10n.CompanyFileDesc,
              icon: Assets.assetsIconsBuilding4,
              onTap: () => context.push(RouteNames.companyFileInstruction),
            ),
            const SizedBox(height: AppSpacing.s12),
            ItemCard(
              title: l10n.CharitableCompanyFile,
              subtitle: l10n.CharitableCompanyFileDesc,
              icon: Assets.assetsIconsBuildings,
              onTap: () => context.push(RouteNames.charitableCompanyFileInstruction),
            ),
            const SizedBox(height: AppSpacing.s32),
            InstructionSectionTitle(
              title: l10n.GeneralInstructions,
              icon: Icons.menu_book_rounded,
            ),
            const SizedBox(height: AppSpacing.s16),
            InstructionTile(
              title: l10n.TaxDeclaration,
              subtitle: l10n.TaxDeclarationDesc,
              icon: Icons.description_rounded,
              color: AppColors.customGreen(),
              onTap: () => context.push(RouteNames.taxDeclaration),
            ),
            const SizedBox(height: AppSpacing.s12),
            InstructionTile(
              title: l10n.TaxPayment,
              subtitle: l10n.TaxPaymentDesc,
              icon: Icons.payment_rounded,
              color: AppColors.customBlue(),
              onTap: () => context.push(RouteNames.taxPayment),
            ),
            const SizedBox(height: AppSpacing.s12),
            InstructionTile(
              title: l10n.TaxExemptions,
              subtitle: l10n.TaxExemptionsDesc,
              icon: Icons.verified_rounded,
              color: AppColors.customOrange(),
              onTap: () => context.push(RouteNames.taxExemptions),
            ),
            const SizedBox(height: AppSpacing.s12),
            InstructionTile(
              title: l10n.Penalties,
              subtitle: l10n.PenaltiesDesc,
              icon: Icons.gavel_rounded,
              color: AppColors.primaryColor(context),
              onTap: () => context.push(RouteNames.penalties),
            ),
            const SizedBox(height: AppSpacing.s32),
          ],
        ),
      ),
    );
  }
}
