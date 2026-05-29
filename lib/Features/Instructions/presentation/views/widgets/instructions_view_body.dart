import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tax_payer/Features/Instructions/data/instructions_items_list.dart';
import 'package:tax_payer/Features/Instructions/data/models/instruction_detail_model.dart';
import 'package:tax_payer/Features/Instructions/presentation/views/widgets/instruction_section_title.dart';
import 'package:tax_payer/Features/Instructions/presentation/views/widgets/instruction_tile.dart';
import 'package:tax_payer/Features/Instructions/presentation/views/widgets/instructions_header.dart';
import 'package:tax_payer/Features/Instructions/presentation/views/widgets/location_card.dart';
import 'package:tax_payer/core/constants/app_spacing.dart';
import 'package:tax_payer/core/routers/route_names.dart';
import 'package:tax_payer/core/utils/app_colors.dart';
import 'package:tax_payer/core/utils/app_text_style.dart';
import 'package:tax_payer/generated/l10n.dart';

class InstructionsViewBody extends StatelessWidget {
  const InstructionsViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);
    List<InstructionDetailModel> instructionPages = instuctionsItemsList(
      context,
      l10n,
    );

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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.s4),
              child: Text(
                l10n.FileOpeningRequirementsDesc,
                style: TextStyles.regular14.copyWith(
                  color: AppColors.secondaryColor(context),
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.s16),
            InstructionTile(
              title: l10n.IndividualFile,
              subtitle: l10n.IndividualFileDesc,
              icon: Icons.person_rounded,
              color: AppColors.customGreen(),
              onTap:
                  () => context.push(
                    RouteNames.instructionsDetail,
                    extra:
                        instructionPages[InstructionPagesName
                            .individualFile
                            .index],
                  ),
            ),
            const SizedBox(height: AppSpacing.s12),
            InstructionTile(
              title: l10n.CompanyFile,
              subtitle: l10n.CompanyFileDesc,
              icon: Icons.business_rounded,
              color: AppColors.customBlue(),
              onTap:
                  () => context.push(
                    RouteNames.instructionsDetail,
                    extra:
                        instructionPages[InstructionPagesName
                            .companyFile
                            .index],
                  ),
            ),
            const SizedBox(height: AppSpacing.s12),
            InstructionTile(
              title: l10n.CharitableCompanyFile,
              subtitle: l10n.CharitableCompanyFileDesc,
              icon: Icons.volunteer_activism_rounded,
              color: AppColors.customOrange(),
              onTap:
                  () => context.push(
                    RouteNames.instructionsDetail,
                    extra:
                        instructionPages[InstructionPagesName
                            .charitableCompanyFile
                            .index],
                  ),
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
              onTap:
                  () => context.push(
                    RouteNames.instructionsDetail,
                    extra:
                        instructionPages[InstructionPagesName
                            .taxDeclaration
                            .index],
                  ),
            ),
            const SizedBox(height: AppSpacing.s12),
            InstructionTile(
              title: l10n.TaxPayment,
              subtitle: l10n.TaxPaymentDesc,
              icon: Icons.payment_rounded,
              color: AppColors.customBlue(),
              onTap:
                  () => context.push(
                    RouteNames.instructionsDetail,
                    extra:
                        instructionPages[InstructionPagesName.taxPayment.index],
                  ),
            ),
            const SizedBox(height: AppSpacing.s12),
            InstructionTile(
              title: l10n.TaxExemptions,
              subtitle: l10n.TaxExemptionsDesc,
              icon: Icons.verified_rounded,
              color: AppColors.customOrange(),
              onTap:
                  () => context.push(
                    RouteNames.instructionsDetail,
                    extra:
                        instructionPages[InstructionPagesName
                            .taxExemptions
                            .index],
                  ),
            ),
            const SizedBox(height: AppSpacing.s12),
            InstructionTile(
              title: l10n.Penalties,
              subtitle: l10n.PenaltiesDesc,
              icon: Icons.gavel_rounded,
              color: AppColors.primaryColor(context),
              onTap:
                  () => context.push(
                    RouteNames.instructionsDetail,
                    extra:
                        instructionPages[InstructionPagesName.penalties.index],
                  ),
            ),
            const SizedBox(height: AppSpacing.s24),
            InstructionSectionTitle(
              title: l10n.TaxOfficeLocation,
              icon: Icons.location_on_rounded,
            ),
            const SizedBox(height: AppSpacing.s12),
            const LocationCard(),
            const SizedBox(height: AppSpacing.s32),
          ],
        ),
      ),
    );
  }
}

enum InstructionPagesName {
  individualFile,
  companyFile,
  charitableCompanyFile,
  taxDeclaration,
  taxPayment,
  taxExemptions,
  penalties,
}
