import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tax_payer/Features/Auth/presentation/logic/reset_password_cubit/reset_password_cubit.dart';
import 'package:tax_payer/Features/Auth/presentation/logic/reset_password_cubit/reset_password_state.dart';
import 'package:tax_payer/core/errors/failuar.dart';
import 'package:tax_payer/core/helper/custom_loading_indicator.dart';
import 'package:tax_payer/core/helper/custom_toast_bar.dart';
import 'package:tax_payer/core/routers/route_names.dart';
import 'package:tax_payer/core/utils/app_colors.dart';
import 'package:tax_payer/core/widgets/custom_button.dart';
import 'package:tax_payer/core/widgets/custom_text_form_feild.dart';
import 'package:tax_payer/generated/l10n.dart';

class ResetPasswordForm extends StatefulWidget {
  const ResetPasswordForm({super.key});

  @override
  State<ResetPasswordForm> createState() => _ResetPasswordFormState();
}

class _ResetPasswordFormState extends State<ResetPasswordForm> {
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  void dispose() {
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
      listener: (context, state) {
        if (state is ResetPasswordSuccess) {
          customToastBar(
            context: context,
            message: S.of(context).PasswordChangedSuccessfully,
            backgroundColor: AppColors.customGreen(),
            icon: Icons.check,
            textColor: AppColors.white(),
          );
          context.go(RouteNames.login);
        } else if (state is ResetPasswordFailure) {
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
          (BuildContext context, ResetPasswordState state) => AbsorbPointer(
            absorbing: state is ResetPasswordLoading,
            child: Form(
              key: formKey,
              autovalidateMode: autovalidateMode,
              child: Column(
                children: [
                  CustomTextFormFeild(
                    controller: newPasswordController,
                    isPassword: true,
                    hintText: S.of(context).NewPassword,
                    keyboardType: TextInputType.visiblePassword,
                    prefixIcon: Icon(
                      Icons.lock,
                      color: AppColors.textPrimaryColor(context),
                      size: 26,
                    ),
                  ),
                  const SizedBox(height: 16),
                  CustomTextFormFeild(
                    controller: confirmPasswordController,
                    isPassword: true,
                    hintText: S.of(context).ConfirmPassword,
                    keyboardType: TextInputType.visiblePassword,
                    prefixIcon: Icon(
                      Icons.lock,
                      color: AppColors.textPrimaryColor(context),
                      size: 26,
                    ),
                    type: 'confirm',
                    passwordController: newPasswordController,
                  ),
                  const SizedBox(height: 17),
                  state is ResetPasswordLoading
                      ? const CustomLoadingIndicator()
                      : CustomButton(
                        title: S.of(context).ResetPassword,
                        onPressed: () {
                          resetPasswordMethod(
                            newPassword: newPasswordController.text,
                            confirmNewPassword: confirmPasswordController.text,
                          );
                        },
                      ),
                ],
              ),
            ),
          ),
    );
  }

  void resetPasswordMethod({
    required String newPassword,
    required String confirmNewPassword,
  }) {
    FocusScope.of(context).unfocus();
    context.go(RouteNames.login);
    // if (formKey.currentState!.validate()) {
    //   formKey.currentState!.save();
    //   autovalidateMode = AutovalidateMode.disabled;
    //   BlocProvider.of<ResetPasswordCubit>(context).changePassword(
    //     newPassword: newPassword,
    //     confirmNewPassword: confirmNewPassword,
    //   );
    // } else {
    //   setState(() {
    //     autovalidateMode = AutovalidateMode.always;
    //   });
    // }
  }
}
