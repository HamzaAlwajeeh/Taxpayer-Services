import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tax_payer/Features/Profile/presentation/views/widgets/section_header.dart';
import 'package:tax_payer/core/constants/app_spacing.dart';
import 'package:tax_payer/core/utils/app_images.dart';
import 'package:tax_payer/core/widgets/custom_text_form_feild.dart';
import 'package:tax_payer/generated/l10n.dart';

class EditProfileForm extends StatelessWidget {
  const EditProfileForm({
    super.key,
    required this.firstNameController,
    required this.lastNameController,
    required this.phoneController,
    required this.passwordController,
    required this.confirmPasswordController,
  });

  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController phoneController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(
          title: S.of(context).BasicInfo,
          iconPath: Assets.assetsIconsProfile,
        ),
        const SizedBox(height: AppSpacing.s16),
        CustomTextFormFeild(
          controller: firstNameController,
          hintText: S.of(context).FirstName,
          keyboardType: TextInputType.name,
          prefixIcon: Padding(
            padding: const EdgeInsets.all(12),
            child: SvgPicture.asset(Assets.assetsIconsUser),
          ),
        ),
        const SizedBox(height: AppSpacing.s16),
        CustomTextFormFeild(
          controller: lastNameController,
          hintText: S.of(context).LastName,
          keyboardType: TextInputType.name,
          prefixIcon: Padding(
            padding: const EdgeInsets.all(12),
            child: SvgPicture.asset(Assets.assetsIconsUser),
          ),
        ),
        const SizedBox(height: AppSpacing.s16),
        CustomTextFormFeild(
          controller: phoneController,
          hintText: S.of(context).PhoneNumber,
          keyboardType: TextInputType.phone,
          prefixIcon: Padding(
            padding: const EdgeInsets.all(12),
            child: SvgPicture.asset(Assets.assetsIconsPhone),
          ),
        ),
        const SizedBox(height: AppSpacing.s24),
        SectionHeader(
          title: S.of(context).Password,
          iconPath: Assets.assetsIconsLock,
        ),
        const SizedBox(height: AppSpacing.s16),
        CustomTextFormFeild(
          controller: passwordController,
          hintText: S.of(context).NewPassword,
          keyboardType: TextInputType.visiblePassword,
          isPassword: true,
          prefixIcon: Padding(
            padding: const EdgeInsets.all(12),
            child: SvgPicture.asset(Assets.assetsIconsLock),
          ),
        ),
        const SizedBox(height: AppSpacing.s16),
        CustomTextFormFeild(
          controller: confirmPasswordController,
          passwordController: passwordController,
          type: 'confirm',
          hintText: S.of(context).ConfirmPassword,
          keyboardType: TextInputType.visiblePassword,
          isPassword: true,
          prefixIcon: Padding(
            padding: const EdgeInsets.all(12),
            child: SvgPicture.asset(Assets.assetsIconsLock),
          ),
        ),
      ],
    );
  }
}
