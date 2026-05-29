import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
    List<InstructionDetailModel> instructionPages = [
      InstructionDetailModel(
        title: l10n.IndividualFile,
        headerIcon: Icons.folder_open_rounded,
        headerDescription: l10n.IndividualFileDesc,
        accentColor: AppColors.customGreen(),
        steps: [
          l10n.IndividualReq1,
          l10n.IndividualReq2,
          l10n.IndividualReq3,
          l10n.IndividualReq4,
          l10n.IndividualReq5,
          l10n.IndividualReq6,
        ],
        note: l10n.IndividualNote,
      ),
      InstructionDetailModel(
        title: l10n.CompanyFile,
        headerIcon: Icons.folder_open_rounded,
        headerDescription: l10n.CompanyFileDesc,
        accentColor: AppColors.customBlue(),
        steps: [
          l10n.IndividualReq1,
          l10n.IndividualReq2,
          l10n.IndividualReq3,
          l10n.IndividualReq4,
          l10n.IndividualReq5,
          l10n.IndividualReq6,
          l10n.CompanyReq1,
          l10n.CompanyReq2,
          l10n.CompanyReq3,
        ],
        note: l10n.CompanyNote,
      ),
      InstructionDetailModel(
        title: l10n.CharitableCompanyFile,
        headerIcon: Icons.volunteer_activism_rounded,
        headerDescription: l10n.CharitableCompanyFileDesc,
        accentColor: AppColors.customOrange(),
        steps: [
          l10n.IndividualReq1,
          l10n.IndividualReq2,
          l10n.IndividualReq3,
          l10n.IndividualReq4,
          l10n.IndividualReq5,
          l10n.IndividualReq6,
          l10n.CharitableReq1,
        ],
        note: l10n.CharitableNote,
      ),
      InstructionDetailModel(
        title: l10n.TaxDeclaration,
        headerIcon: Icons.description_rounded,
        headerDescription: l10n.TaxDeclarationDesc,
        accentColor: AppColors.customGreen(),
        steps: [
          l10n.TaxDeclarationStep1,
          l10n.TaxDeclarationStep2,
          l10n.TaxDeclarationStep3,
          l10n.TaxDeclarationStep4,
          l10n.TaxDeclarationStep5,
        ],
      ),
      InstructionDetailModel(
        title: l10n.TaxPayment,
        headerIcon: Icons.payment_rounded,
        headerDescription: l10n.TaxPaymentDesc,
        accentColor: AppColors.customBlue(),
        steps: [
          l10n.TaxPaymentStep1,
          l10n.TaxPaymentStep2,
          l10n.TaxPaymentStep3,
          l10n.TaxPaymentStep4,
        ],
      ),
      InstructionDetailModel(
        title: l10n.TaxExemptions,
        headerIcon: Icons.verified_rounded,
        headerDescription: l10n.TaxExemptionsDesc,
        accentColor: AppColors.customOrange(),
        steps: [
          l10n.TaxExemptionsStep1,
          l10n.TaxExemptionsStep2,
          l10n.TaxExemptionsStep3,
          l10n.TaxExemptionsStep4,
        ],
      ),
      InstructionDetailModel(
        title: l10n.Penalties,
        headerIcon: Icons.gavel_rounded,
        headerDescription: l10n.PenaltiesDesc,
        accentColor: AppColors.primaryColor(context),
        steps: [
          l10n.PenaltiesStep1,
          l10n.PenaltiesStep2,
          l10n.PenaltiesStep3,
          l10n.PenaltiesStep4,
        ],
      ),
    ];

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
