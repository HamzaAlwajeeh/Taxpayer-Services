import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tax_payer/Features/Auth/presentation/logic/verify_code_cubit/verify_code_cubit.dart';
import 'package:tax_payer/Features/Auth/presentation/logic/verify_code_cubit/verify_code_state.dart';
import 'package:tax_payer/core/constants/constants.dart';
import 'package:tax_payer/core/errors/failuar.dart';
import 'package:tax_payer/core/helper/custom_loading_indicator.dart';
import 'package:tax_payer/core/helper/custom_toast_bar.dart';
import 'package:tax_payer/core/routers/route_names.dart';
import 'package:tax_payer/core/services/shared_pref_singleton.dart';
import 'package:tax_payer/core/utils/app_colors.dart';
import 'package:tax_payer/core/widgets/custom_button.dart';
import 'package:tax_payer/core/widgets/custom_text_form_feild.dart';
import 'package:tax_payer/generated/l10n.dart';

class VerifyCodeForm extends StatefulWidget {
  const VerifyCodeForm({super.key});

  @override
  State<VerifyCodeForm> createState() => _VerifyCodeFormState();
}

class _VerifyCodeFormState extends State<VerifyCodeForm> {
  TextEditingController codeController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  void dispose() {
    codeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VerifyCodeCubit, VerifyCodeState>(
      listener: (context, state) {
        if (state is VerifyCodeSuccess) {
          customToastBar(
            context: context,
            message: S.of(context).CodeVerifiedSuccessfully,
            backgroundColor: AppColors.customGreen(),
            icon: Icons.check,
            textColor: AppColors.white(),
          );
          context.push(RouteNames.resetPassword);
        } else if (state is VerifyCodeFailure) {
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
      builder: (BuildContext context, VerifyCodeState state) => Form(
        key: formKey,
        autovalidateMode: autovalidateMode,
        child: Column(
          children: [
            CustomTextFormFeild(
              controller: codeController,
              hintText: S.of(context).VerificationCode,
              keyboardType: TextInputType.number,
              suffixIcon: Icon(
                Icons.verified,
                color: AppColors.textPrimaryColor(context),
                size: 26,
              ),
            ),
            const SizedBox(height: 17),
            state is VerifyCodeLoading
                ? const CustomLoadingIndicator()
                : CustomButton(
                    title: S.of(context).Next,
                    onPressed: () {
                      verifyCodeMethod(code: codeController.text);
                    },
                  ),
            const SizedBox(height: 17),
            TextButton(
              onPressed: () {
                // TODO: Implement resend code logic
              },
              child: Text(
                S.of(context).ResendCode,
                style: TextStyle(color: AppColors.customBlue()),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void verifyCodeMethod({required String code}) {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      autovalidateMode = AutovalidateMode.disabled;
      BlocProvider.of<VerifyCodeCubit>(context).verifyCode(code: code);
    } else {
      setState(() {
        autovalidateMode = AutovalidateMode.always;
      });
    }
  }
}