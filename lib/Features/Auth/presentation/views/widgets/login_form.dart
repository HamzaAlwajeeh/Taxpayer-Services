import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tax_payer/Features/Base/presentation/views/home_base.dart';
import 'package:tax_payer/core/utils/app_colors.dart';
import 'package:tax_payer/core/widgets/custom_button.dart';
import 'package:tax_payer/core/widgets/custom_text_form_feild.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          CustomTextFormFeild(
            controller: emailController,
            hintText: 'البريد الإلكتروني',
            keyboardType: TextInputType.emailAddress,
            suffixIcon: Icon(
              Icons.email,
              color: AppColors.textPrimaryColor(),
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
          CustomButton(title: 'تسجيل الدخول', onPressed: loginMethod),
        ],
      ),
    );
  }

  void loginMethod() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      autovalidateMode = AutovalidateMode.disabled;
      context.go(HomeBase.routeName);
    } else {
      setState(() {
        autovalidateMode = AutovalidateMode.always;
      });
    }
  }
}
