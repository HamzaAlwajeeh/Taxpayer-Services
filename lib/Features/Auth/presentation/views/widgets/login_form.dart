import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tax_payer/Features/Auth/presentation/logic/login_cubit/login_cubit.dart';
import 'package:tax_payer/Features/Auth/presentation/logic/login_cubit/login_state.dart';
import 'package:tax_payer/Features/Auth/presentation/views/widgets/has_an_account.dart';
import 'package:tax_payer/Features/Auth/presentation/views/widgets/remember_me_widget.dart';
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

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController userNameController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  bool isRememberMe = false;

  @override
  void initState() {
    super.initState();
    _loadSavedCredentials();
  }

  void _loadSavedCredentials() {
    final savedUsername = Prefs.getString(AppConstants.kSavedUsername);

    final savedPassword = Prefs.getString(AppConstants.kSavedPassword);

    if (savedUsername != null && savedPassword != null) {
      userNameController.text = savedUsername;
      passwordController.text = savedPassword;

      setState(() {
        isRememberMe = true;
      });
    }
  }

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
          if (isRememberMe) {
            Prefs.setString(
              AppConstants.kSavedUsername,
              userNameController.text,
            );

            Prefs.setString(
              AppConstants.kSavedPassword,
              passwordController.text,
            );
          } else {
            Prefs.removeString(AppConstants.kSavedUsername);
            Prefs.removeString(AppConstants.kSavedPassword);
          }

          customToastBar(
            context: context,
            message: S.of(context).LoginSuccess,
            backgroundColor: AppColors.customGreen(),
            icon: Icons.check,
            textColor: AppColors.white(),
          );

          Prefs.setBool(AppConstants.kIsLogedIn, true);

          Prefs.setUser(AppConstants.kCurrentUser, state.user);

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

      builder: (BuildContext context, LoginState state) {
        return AbsorbPointer(
          absorbing: state is LoginLoading,
          child: Form(
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
                  controller: passwordController,
                  isPassword: true,
                  hintText: S.of(context).Password,
                  keyboardType: TextInputType.visiblePassword,
                ),

                const SizedBox(height: 12),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RememberMeWidget(
                      value: isRememberMe,
                      onChanged: (value) {
                        setState(() {
                          isRememberMe = value ?? false;
                        });
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: TextButton(
                        onPressed: () {
                          context.push(RouteNames.forgotPassword);
                        },
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: const Size(50, 30),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: Text(
                          S.of(context).ForgotPassword,
                          style: TextStyle(
                            color: AppColors.primaryColor(context),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                HasAnAccount(
                  isLoginView: true,
                  primaryText: S.of(context).DontHaveAccount,
                  secondaryText: S.of(context).SignUp,
                ),
                const SizedBox(height: 17),
                state is LoginLoading
                    ? const CustomLoadingIndicator()
                    : CustomButton(
                      title: S.of(context).Login,
                      onPressed: () {
                        loginMethod(
                          userName: userNameController.text,
                          password: passwordController.text,
                        );
                      },
                    ),
                const SizedBox(height: 12),
                CustomButton(
                  title: S.of(context).LoginAsGuest,
                  isOutlined: true,
                  onPressed: () {
                    context.go(RouteNames.dashboard);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void loginMethod({required String userName, required String password}) {
    FocusScope.of(context).unfocus();

    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      setState(() {
        autovalidateMode = AutovalidateMode.disabled;
      });

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
