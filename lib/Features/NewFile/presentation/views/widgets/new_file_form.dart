import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tax_payer/Features/Auth/presentation/views/widgets/upload_file.dart';
import 'package:tax_payer/Features/NewFile/presentation/logic/new_file_cubit/new_file_cubit.dart';
import 'package:tax_payer/Features/NewFile/presentation/logic/new_file_cubit/new_file_state.dart';
import 'package:tax_payer/Features/NewFile/presentation/views/widgets/file_type_selected_card.dart';
import 'package:tax_payer/core/errors/failuar.dart';
import 'package:tax_payer/core/helper/custom_loading_indicator.dart';
import 'package:tax_payer/core/helper/custom_toast_bar.dart';
import 'package:tax_payer/core/routers/route_names.dart';
import 'package:tax_payer/core/utils/app_colors.dart';
import 'package:tax_payer/core/utils/app_text_style.dart';
import 'package:tax_payer/core/widgets/custom_button.dart';
import 'package:tax_payer/core/widgets/custom_text_form_feild.dart';
import 'package:tax_payer/generated/l10n.dart';

class NewFileForm extends StatefulWidget {
  const NewFileForm({super.key});

  @override
  State<NewFileForm> createState() => _NewFileFormState();
}

class _NewFileFormState extends State<NewFileForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  final TextEditingController tradeNameController = TextEditingController();

  String selectedFileType = 'Individual';

  // Common files
  File? commercialRecord;
  File? activityLicense;
  File? tradePicture;
  File? insuranceCard;
  File? propertyDocPicture;

  // Company required files
  File? articlesOfIncorporation;
  File? governmentLicense;
  File? partinersIDCards;

  // CharitableCompany required files
  File? bylawsCopy;

  @override
  void dispose() {
    tradeNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);

    return BlocConsumer<NewFileCubit, NewFileState>(
      listener: (context, state) {
        if (state is NewFileSuccess) {
          customToastBar(
            context: context,
            message: state.message,
            backgroundColor: AppColors.customGreen(),
            icon: Icons.check,
            textColor: AppColors.white(),
          );
          clearForm();
          if (context.canPop()) {
            context.pop();
          } else {
            context.go(RouteNames.dashboard);
          }
        } else if (state is NewFileFailure) {
          customToastBar(
            context: context,
            message: Failure.localizedMessage(
              context,
              errorMessage: state.errorMessage,
              errorKey: state.errorKey,
            ),
            backgroundColor: AppColors.red(),
            icon: Icons.close,
            textColor: AppColors.white(),
          );
        }
      },
      builder: (BuildContext context, NewFileState state) {
        return AbsorbPointer(
          absorbing: state is NewFileLoading,
          child: Form(
            key: formKey,
            autovalidateMode: autovalidateMode,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.FileType,
                  style: TextStyles.bold16.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.textBoldColor(context),
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: FileTypeSelectorCard(
                        title: l10n.IndividualFile,
                        icon: Icons.person_outline_rounded,
                        isSelected: selectedFileType == 'Individual',
                        onTap: () {
                          setState(() {
                            selectedFileType = 'Individual';
                          });
                        },
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: FileTypeSelectorCard(
                        title: l10n.CompanyFile,
                        icon: Icons.business_outlined,
                        isSelected: selectedFileType == 'Company',
                        onTap: () {
                          setState(() {
                            selectedFileType = 'Company';
                          });
                        },
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: FileTypeSelectorCard(
                        title: l10n.CharitableCompanyFile,
                        icon: Icons.volunteer_activism_outlined,
                        isSelected: selectedFileType == 'CharitableCompany',
                        onTap: () {
                          setState(() {
                            selectedFileType = 'CharitableCompany';
                          });
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                CustomTextFormFeild(
                  controller: tradeNameController,
                  hintText: l10n.TradeNameField,
                  keyboardType: TextInputType.text,
                  prefixIcon: Icon(
                    Icons.storefront_rounded,
                    color: AppColors.textPrimaryColor(context),
                  ),
                ),
                const SizedBox(height: 16),

                // Common Required files
                UploadFile(
                  title: l10n.CommercialRecordField,
                  subTitle: 'PDF , JPG , PNG',
                  isStoreImage: false,
                  allowPdf: true,
                  useLocalState: true,
                  file: commercialRecord,
                  onImageChanged: (file) {
                    setState(() {
                      commercialRecord = file;
                    });
                  },
                ),
                const SizedBox(height: 16),
                UploadFile(
                  title: l10n.ActivityLicenseField,
                  subTitle: 'PDF , JPG , PNG',
                  isStoreImage: false,
                  allowPdf: true,
                  useLocalState: true,
                  file: activityLicense,
                  onImageChanged: (file) {
                    setState(() {
                      activityLicense = file;
                    });
                  },
                ),
                const SizedBox(height: 16),
                UploadFile(
                  title: l10n.TradePictureField,
                  subTitle: 'PDF , JPG , PNG',
                  isStoreImage: false,
                  allowPdf: true,
                  useLocalState: true,
                  file: tradePicture,
                  onImageChanged: (file) {
                    setState(() {
                      tradePicture = file;
                    });
                  },
                ),
                const SizedBox(height: 16),
                UploadFile(
                  title: l10n.InsuranceCardField,
                  subTitle: 'PDF , JPG , PNG',
                  isStoreImage: false,
                  allowPdf: true,
                  useLocalState: true,
                  file: insuranceCard,
                  onImageChanged: (file) {
                    setState(() {
                      insuranceCard = file;
                    });
                  },
                ),
                const SizedBox(height: 16),
                UploadFile(
                  title: l10n.PropertyDocPictureField,
                  subTitle: 'PDF , JPG , PNG',
                  isStoreImage: false,
                  allowPdf: true,
                  useLocalState: true,
                  file: propertyDocPicture,
                  onImageChanged: (file) {
                    setState(() {
                      propertyDocPicture = file;
                    });
                  },
                ),
                const SizedBox(height: 16),

                // Conditionally visible fields
                if (selectedFileType == 'Company') ...[
                  UploadFile(
                    title: l10n.ArticlesOfIncorporationField,
                    subTitle: 'PDF , JPG , PNG',
                    isStoreImage: false,
                    allowPdf: true,
                    useLocalState: true,
                    isRequired: true,
                    file: articlesOfIncorporation,
                    onImageChanged: (file) {
                      setState(() {
                        articlesOfIncorporation = file;
                      });
                    },
                  ),
                  const SizedBox(height: 16),
                  UploadFile(
                    title: l10n.GovernmentLicenseField,
                    subTitle: 'PDF , JPG , PNG',
                    isStoreImage: false,
                    allowPdf: true,
                    useLocalState: true,
                    isRequired: true,
                    file: governmentLicense,
                    onImageChanged: (file) {
                      setState(() {
                        governmentLicense = file;
                      });
                    },
                  ),
                  const SizedBox(height: 16),
                  UploadFile(
                    title: l10n.PartinersIDCardsField,
                    subTitle: 'PDF , JPG , PNG',
                    isStoreImage: false,
                    allowPdf: true,
                    useLocalState: true,
                    isRequired: true,
                    file: partinersIDCards,
                    onImageChanged: (file) {
                      setState(() {
                        partinersIDCards = file;
                      });
                    },
                  ),
                  const SizedBox(height: 16),
                ],

                if (selectedFileType == 'CharitableCompany') ...[
                  UploadFile(
                    title: l10n.BylawsCopyField,
                    subTitle: 'PDF , JPG , PNG',
                    isStoreImage: false,
                    allowPdf: true,
                    useLocalState: true,
                    isRequired: true,
                    file: bylawsCopy,
                    onImageChanged: (file) {
                      setState(() {
                        bylawsCopy = file;
                      });
                    },
                  ),
                  const SizedBox(height: 16),
                ],

                state is NewFileLoading
                    ? const Center(child: CustomLoadingIndicator())
                    : CustomButton(
                      title: l10n.SubmitNewFileRequest,
                      onPressed: () => createNewFile(context),
                    ),
              ],
            ),
          ),
        );
      },
    );
  }

  void createNewFile(BuildContext context) {
    FocusScope.of(context).unfocus();
    final l10n = S.of(context);

    // Check required files based on selected file type
    bool isMissingRequired =
        commercialRecord == null ||
        activityLicense == null ||
        tradePicture == null ||
        insuranceCard == null ||
        propertyDocPicture == null;

    if (selectedFileType == 'Company') {
      if (articlesOfIncorporation == null ||
          governmentLicense == null ||
          partinersIDCards == null) {
        isMissingRequired = true;
      }
    } else if (selectedFileType == 'CharitableCompany') {
      if (bylawsCopy == null) {
        isMissingRequired = true;
      }
    }

    if (isMissingRequired) {
      setState(() {
        autovalidateMode = AutovalidateMode.always;
      });
      customToastBar(
        context: context,
        message: l10n.UploadAllDocumentsError,
        backgroundColor: AppColors.red(),
        icon: Icons.error_outline_rounded,
        textColor: AppColors.white(),
      );
      return;
    }

    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      autovalidateMode = AutovalidateMode.disabled;

      BlocProvider.of<NewFileCubit>(context).createNewFile(
        tradeName: tradeNameController.text.trim(),
        commercialRecord: commercialRecord!,
        activityLicense: activityLicense!,
        tradePicture: tradePicture!,
        insuranceCard: insuranceCard!,
        propertyDocPicture: propertyDocPicture!,
        fileType: selectedFileType,
        articlesOfIncorporation:
            selectedFileType == 'Company' ? articlesOfIncorporation : null,
        governmentLicense:
            selectedFileType == 'Company' ? governmentLicense : null,
        partinersIDCards:
            selectedFileType == 'Company' ? partinersIDCards : null,
        bylawsCopy: selectedFileType == 'CharitableCompany' ? bylawsCopy : null,
      );
    } else {
      setState(() {
        autovalidateMode = AutovalidateMode.always;
      });
    }
  }

  void clearForm() {
    tradeNameController.clear();
    setState(() {
      commercialRecord = null;
      activityLicense = null;
      tradePicture = null;
      insuranceCard = null;
      propertyDocPicture = null;
      articlesOfIncorporation = null;
      governmentLicense = null;
      partinersIDCards = null;
      bylawsCopy = null;
      autovalidateMode = AutovalidateMode.disabled;
    });
    formKey.currentState?.reset();
  }
}
