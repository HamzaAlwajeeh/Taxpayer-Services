import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tax_payer/Features/Auth/presentation/logic/register_cubit/register_cubit.dart';
import 'package:tax_payer/Features/Auth/presentation/logic/register_cubit/register_state.dart';
import 'package:tax_payer/Features/Auth/presentation/views/widgets/upload_image.dart';
import 'package:tax_payer/core/constants/app_spacing.dart';
import 'package:tax_payer/core/errors/failuar.dart';
import 'package:tax_payer/core/helper/custom_loading_indicator.dart';
import 'package:tax_payer/core/helper/custom_toast_bar.dart';
import 'package:tax_payer/core/routers/route_names.dart';
import 'package:tax_payer/core/utils/app_colors.dart';
import 'package:tax_payer/core/utils/app_images.dart';
import 'package:tax_payer/core/widgets/build_svg_icon.dart';
import 'package:tax_payer/core/widgets/custom_button.dart';
import 'package:tax_payer/core/widgets/custom_text_form_feild.dart';
import 'package:tax_payer/generated/l10n.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  File? idCardImage;
  File? profileImage;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    phoneController.dispose();
    usernameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterSuccess) {
          customToastBar(
            context: context,
            message: state.message,
            backgroundColor: AppColors.customGreen(),
            icon: Icons.check,
            textColor: AppColors.white(),
          );
          context.go(RouteNames.login);
        } else if (state is RegisterFailure) {
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
      builder:
          (BuildContext context, RegisterState state) => Form(
            key: formKey,
            autovalidateMode: autovalidateMode,
            child: Column(
              spacing: AppSpacing.s16,
              children: [
                CustomTextFormFeild(
                  controller: firstNameController,
                  hintText: S.of(context).FirstName,
                  keyboardType: TextInputType.text,
                  prefixIcon: buildSvgIcon(context, Assets.assetsIconsUser),
                ),
                CustomTextFormFeild(
                  controller: lastNameController,
                  hintText: S.of(context).LastName,
                  keyboardType: TextInputType.text,
                  prefixIcon: buildSvgIcon(context, Assets.assetsIconsUser),
                ),
                CustomTextFormFeild(
                  controller: usernameController,
                  hintText: S.of(context).UserName,
                  keyboardType: TextInputType.text,
                  prefixIcon: buildSvgIcon(
                    context,
                    Assets.assetsIconsPersonalcard,
                  ),
                ),
                CustomTextFormFeild(
                  controller: phoneController,
                  hintText: S.of(context).PhoneNumber,
                  keyboardType: TextInputType.phone,
                  prefixIcon: buildSvgIcon(context, Assets.assetsIconsPhone),
                ),
                CustomTextFormFeild(
                  prefixIcon: buildSvgIcon(context, Assets.assetsIconsLock),
                  controller: passwordController,
                  isPassword: true,
                  hintText: S.of(context).Password,
                  keyboardType: TextInputType.visiblePassword,
                ),
                CustomTextFormFeild(
                  prefixIcon: buildSvgIcon(context, Assets.assetsIconsLock),
                  controller: confirmPasswordController,
                  isPassword: true,
                  hintText: S.of(context).ConfirmPassword,
                  keyboardType: TextInputType.visiblePassword,
                  type: 'confirm',
                  passwordController: passwordController,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  child: UploadImage(
                    title: S.of(context).IdCard,
                    subTitle: 'JPEG,JPG,PNG',
                    isStoreImage: false,
                    onImageChanged: (image) {
                      idCardImage = image;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  child: UploadImage(
                    title: S.of(context).ProfileImage,
                    subTitle: 'JPEG,JPG,PNG,GIF',
                    isStoreImage: true,
                    isRequired: false,
                    onImageChanged: (image) {
                      profileImage = image;
                    },
                  ),
                ),
                state is RegisterLoading
                    ? const CustomLoadingIndicator()
                    : CustomButton(
                      title: S.of(context).SignUp,
                      onPressed: signUpMethod,
                    ),
              ],
            ),
          ),
    );
  }

  void signUpMethod() {
    if (formKey.currentState!.validate() && idCardImage != null) {
      formKey.currentState!.save();
      autovalidateMode = AutovalidateMode.disabled;
      BlocProvider.of<RegisterCubit>(context).register(
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        phone: phoneController.text,
        idCard: idCardImage!,
        image: profileImage,
        userName: usernameController.text,
        password: passwordController.text,
        confirmPassword: confirmPasswordController.text,
      );
    } else {
      setState(() {
        autovalidateMode = AutovalidateMode.always;
      });
    }
  }
}
