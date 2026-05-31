import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';
import 'package:tax_payer/Features/Auth/presentation/logic/reset_password_request_cubit/reset_password_request_cubit.dart';
import 'package:tax_payer/Features/Auth/presentation/logic/verify_code_cubit/verify_code_cubit.dart';
import 'package:tax_payer/Features/Auth/presentation/logic/verify_code_cubit/verify_code_state.dart';
import 'package:tax_payer/core/constants/app_spacing.dart';
import 'package:tax_payer/core/constants/constants.dart';
import 'package:tax_payer/core/errors/failuar.dart';
import 'package:tax_payer/core/helper/custom_loading_indicator.dart';
import 'package:tax_payer/core/helper/custom_toast_bar.dart';
import 'package:tax_payer/core/routers/route_names.dart';
import 'package:tax_payer/core/services/shared_pref_singleton.dart';
import 'package:tax_payer/core/utils/app_colors.dart';
import 'package:tax_payer/core/utils/app_text_style.dart';
import 'package:tax_payer/core/widgets/custom_button.dart';
import 'package:tax_payer/generated/l10n.dart';

class VerifyCodeForm extends StatefulWidget {
  const VerifyCodeForm({super.key});
  @override
  State<VerifyCodeForm> createState() => _VerifyCodeFormState();
}

class _VerifyCodeFormState extends State<VerifyCodeForm> {
  final TextEditingController _pinController = TextEditingController();
  final FocusNode _pinFocusNode = FocusNode();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  Timer? _timer;
  int _secondsRemaining = 60;
  bool _isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _secondsRemaining = 60;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining == 0) {
        setState(() {
          timer.cancel();
        });
      } else {
        setState(() {
          _secondsRemaining--;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pinController.dispose();
    _pinFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 60,
      height: 60,
      textStyle: TextStyles.bold22.copyWith(
        color: AppColors.textPrimaryColor(context),
      ),
      decoration: BoxDecoration(
        color: AppColors.textFeilColor(context),
        borderRadius: BorderRadius.circular(AppSpacing.radius16),
        border: Border.all(color: AppColors.borderColor(context), width: 1),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        border: Border.all(color: AppColors.primaryColor(context), width: 2),
      ),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        border: Border.all(color: AppColors.primaryColor(context), width: 1),
      ),
    );

    return BlocConsumer<VerifyCodeCubit, VerifyCodeState>(
      listener: (context, state) {
        if (state is VerifyCodeSuccess) {
          Prefs.removeString(AppConstants.kResetPasswordUsername);
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
      builder:
          (BuildContext context, VerifyCodeState state) => AbsorbPointer(
            absorbing: state is VerifyCodeLoading,
            child: Form(
              key: formKey,
              autovalidateMode: autovalidateMode,
              child: Column(
                children: [
                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: Pinput(
                      length: 4,
                      controller: _pinController,
                      focusNode: _pinFocusNode,
                      defaultPinTheme: defaultPinTheme,
                      focusedPinTheme: focusedPinTheme,
                      submittedPinTheme: submittedPinTheme,
                      separatorBuilder: (index) => const SizedBox(width: 12),
                      hapticFeedbackType: HapticFeedbackType.lightImpact,
                      onChanged: (value) {
                        setState(() {
                          _isButtonEnabled = value.length == 4;
                        });
                      },
                      onCompleted: (pin) {
                        verifyCodeMethod(
                          code: int.tryParse(pin) ?? 0,
                          userId:
                              BlocProvider.of<ResetPasswordRequestCubit>(
                                context,
                              ).userId,
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 24),
                  state is VerifyCodeLoading
                      ? const CustomLoadingIndicator()
                      : CustomButton(
                        title: S.of(context).Verify,
                        onPressed:
                            _isButtonEnabled
                                ? () {
                                  verifyCodeMethod(
                                    code:
                                        int.tryParse(_pinController.text) ?? 0,
                                    userId:
                                        BlocProvider.of<
                                          ResetPasswordRequestCubit
                                        >(context).userId,
                                  );
                                }
                                : null,
                      ),
                  const SizedBox(height: 17),
                  _secondsRemaining > 0
                      ? Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          "${S.of(context).ResendCode} (${_secondsRemaining}s)",
                          style: TextStyle(
                            color: AppColors.textPrimaryColor(
                              context,
                            ).withValues(alpha: 0.5),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                      : TextButton(
                        onPressed: () {
                          final userName =
                              Prefs.getString(
                                AppConstants.kResetPasswordUsername,
                              ) ??
                              '';
                          if (userName.isNotEmpty) {
                            BlocProvider.of<ResetPasswordRequestCubit>(
                              context,
                            ).resetPasswordRequest(userName: userName);
                            _startTimer();
                          }
                        },
                        child: Text(
                          S.of(context).ResendCode,
                          style: TextStyle(color: AppColors.customBlue()),
                        ),
                      ),
                ],
              ),
            ),
          ),
    );
  }

  void verifyCodeMethod({required int code, required int userId}) {
    FocusScope.of(context).unfocus();
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      autovalidateMode = AutovalidateMode.disabled;
      BlocProvider.of<VerifyCodeCubit>(
        context,
      ).verifyCode(code: code, userId: userId);
    } else {
      setState(() {
        autovalidateMode = AutovalidateMode.always;
      });
    }
  }
}
