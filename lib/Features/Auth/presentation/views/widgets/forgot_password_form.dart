import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tax_payer/Features/Auth/presentation/logic/forgot_password_cubit/forgot_password_cubit.dart';
import 'package:tax_payer/Features/Auth/presentation/logic/forgot_password_cubit/forgot_password_state.dart';
import 'package:tax_payer/core/errors/failuar.dart';
import 'package:tax_payer/core/helper/custom_loading_indicator.dart';
import 'package:tax_payer/core/helper/custom_toast_bar.dart';
import 'package:tax_payer/core/routers/route_names.dart';
import 'package:tax_payer/core/utils/app_colors.dart';
import 'package:tax_payer/core/widgets/custom_button.dart';
import 'package:tax_payer/core/widgets/custom_text_form_feild.dart';
import 'package:tax_payer/generated/l10n.dart';

class ForgotPasswordForm extends StatefulWidget {
  const ForgotPasswordForm({super.key});

  @override
  State<ForgotPasswordForm> createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  void dispose() {
    userNameController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
      listener: (context, state) {
        if (state is ForgotPasswordSuccess) {
          customToastBar(
            context: context,
            message: S.of(context).CodeSentSuccessfully,
            backgroundColor: AppColors.customGreen(),
            icon: Icons.check,
            textColor: AppColors.white(),
          );
          context.push(RouteNames.verifyCode);
        } else if (state is ForgotPasswordFailure) {
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
          (BuildContext context, ForgotPasswordState state) => Form(
            key: formKey,
            autovalidateMode: autovalidateMode,
            child: Column(
              children: [
                CustomTextFormFeild(
                  controller: userNameController,
                  hintText: S.of(context).UserName,
                  keyboardType: TextInputType.text,
                  suffixIcon: Icon(
                    Icons.person,
                    color: AppColors.textPrimaryColor(context),
                    size: 26,
                  ),
                ),
                const SizedBox(height: 16),
                CustomTextFormFeild(
                  controller: phoneController,
                  hintText: S.of(context).PhoneNumber,
                  keyboardType: TextInputType.phone,
                  suffixIcon: Icon(
                    Icons.phone,
                    color: AppColors.textPrimaryColor(context),
                    size: 26,
                  ),
                ),
                const SizedBox(height: 17),
                state is ForgotPasswordLoading
                    ? const CustomLoadingIndicator()
                    : CustomButton(
                      title: S.of(context).Next,
                      onPressed: () {
                        forgotPasswordMethod(
                          userName: userNameController.text,
                          phone: phoneController.text,
                        );
                      },
                    ),
              ],
            ),
          ),
    );
  }

  void forgotPasswordMethod({required String userName, required String phone}) {
    context.push(RouteNames.verifyCode);
    // if (formKey.currentState!.validate()) {
    //   formKey.currentState!.save();
    //   autovalidateMode = AutovalidateMode.disabled;
    //   BlocProvider.of<ForgotPasswordCubit>(
    //     context,
    //   ).forgetPassword(userName: userName, phone: phone);
    // } else {
    //   setState(() {
    //     autovalidateMode = AutovalidateMode.always;
    //   });
    // }
  }
}
