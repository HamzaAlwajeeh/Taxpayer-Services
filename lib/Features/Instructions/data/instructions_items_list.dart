import 'package:flutter/material.dart';
import 'package:tax_payer/Features/Instructions/data/models/instruction_detail_model.dart';
import 'package:tax_payer/core/utils/app_colors.dart';

List<InstructionDetailModel> instuctionsItemsList(
  BuildContext context,
  final l10n,
) {
  return [
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
      note: l10n.TaxOfficeAttendanceNote,
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
      note: l10n.TaxOfficeAttendanceNote,
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
      note: l10n.TaxOfficeAttendanceNote,
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
}
