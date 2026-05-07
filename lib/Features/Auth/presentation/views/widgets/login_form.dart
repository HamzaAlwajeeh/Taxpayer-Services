import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tax_payer/Features/Auth/presentation/logic/login_cubit/login_cubit.dart';
import 'package:tax_payer/Features/Auth/presentation/logic/login_cubit/login_state.dart';
import 'package:tax_payer/core/errors/failuar.dart';
import 'package:tax_payer/core/helper/custom_loading_indicator.dart';
import 'package:tax_payer/core/helper/custom_toast_bar.dart';
import 'package:tax_payer/core/routers/route_names.dart';
import 'package:tax_payer/core/utils/app_colors.dart';
import 'package:tax_payer/core/widgets/custom_button.dart';
import 'package:tax_payer/core/widgets/custom_text_form_feild.dart';
import 'package:tax_payer/generated/l10n.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  void dispose() {
    userNameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          customToastBar(
            context: context,
            message: S.of(context).LoginSuccess,
            backgroundColor: AppColors.customGreen(),
            icon: Icons.check,
            textColor: AppColors.white(),
          );
          context.go(RouteNames.dashboard);
        } else if (state is LoginFailure) {
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
          (BuildContext context, LoginState state) => Form(
            key: formKey,
            autovalidateMode: autovalidateMode,
            child: Column(
              children: [
                CustomTextFormFeild(
                  controller: userNameController,
                  hintText: 'اسم المستخدم',
                  keyboardType: TextInputType.text,
                  suffixIcon: Icon(
                    Icons.person,
                    color: AppColors.textPrimaryColor(context),
                    size: 26,
                  ),
                ),
                const SizedBox(height: 16),
                CustomTextFormFeild(
                  controller: passwordController,
                  isPassword: true,
                  hintText: 'كلمة المرور',
                  keyboardType: TextInputType.visiblePassword,
                ),
                const SizedBox(height: 17),
                state is LoginLoading
                    ? const CustomLoadingIndicator()
                    : CustomButton(
                      title: 'تسجيل الدخول',
                      onPressed: () {
                        loginMethod(
                          userName: userNameController.text,
                          password: passwordController.text,
                        );
                      },
                    ),
              ],
            ),
          ),
    );
  }

  void loginMethod({required String userName, required String password}) {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      autovalidateMode = AutovalidateMode.disabled;
      BlocProvider.of<LoginCubit>(
        context,
      ).login(userName: userName, password: password);
    } else {
      setState(() {
        autovalidateMode = AutovalidateMode.always;
      });
    }
  }
}
