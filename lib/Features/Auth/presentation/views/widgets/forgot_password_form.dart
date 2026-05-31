import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tax_payer/Features/Auth/presentation/logic/reset_password_request_cubit/reset_password_request_cubit.dart';
import 'package:tax_payer/Features/Auth/presentation/logic/reset_password_request_cubit/reset_password_request_state.dart';
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

class ForgotPasswordForm extends StatefulWidget {
  const ForgotPasswordForm({super.key});

  @override
  State<ForgotPasswordForm> createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  TextEditingController userNameController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  void dispose() {
    userNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ResetPasswordRequestCubit, ResetPasswordRequestState>(
      listener: (context, state) {
        if (state is ResetPasswordRequestSuccess) {
          customToastBar(
            context: context,
            message: S.of(context).CodeSentSuccessfully,
            backgroundColor: AppColors.customGreen(),
            icon: Icons.check,
            textColor: AppColors.white(),
          );
          context.push(RouteNames.verifyCode);
        } else if (state is ResetPasswordRequestFailure) {
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
          (BuildContext context, ResetPasswordRequestState state) =>
              AbsorbPointer(
                absorbing: state is ResetPasswordRequestLoading,
                child: Form(
                  key: formKey,
                  autovalidateMode: autovalidateMode,
                  child: Column(
                    children: [
                      CustomTextFormFeild(
                        controller: userNameController,
                        hintText: S.of(context).UserName,
                        keyboardType: TextInputType.text,
                        prefixIcon: buildSvgIcon(
                          context,
                          Assets.assetsIconsUser,
                        ),
                      ),
                      const SizedBox(height: 17),
                      state is ResetPasswordRequestLoading
                          ? const CustomLoadingIndicator()
                          : CustomButton(
                            title: S.of(context).Next,
                            onPressed: () {
                              resetPasswordRequestMethod(
                                userName: userNameController.text,
                              );
                            },
                          ),
                    ],
                  ),
                ),
              ),
    );
  }

  void resetPasswordRequestMethod({required String userName}) {
    FocusScope.of(context).unfocus();
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      autovalidateMode = AutovalidateMode.disabled;
      BlocProvider.of<ResetPasswordRequestCubit>(
        context,
      ).resetPasswordRequest(userName: userName);
    } else {
      setState(() {
        autovalidateMode = AutovalidateMode.always;
      });
    }
  }
}
