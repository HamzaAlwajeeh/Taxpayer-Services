import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tax_payer/Features/Auth/presentation/views/create_store_view.dart';
import 'package:tax_payer/core/utils/app_colors.dart';
import 'package:tax_payer/core/widgets/custom_button.dart';
import 'package:tax_payer/core/widgets/custom_text_form_feild.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    usernameController.dispose();
    confirmPasswordController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          const SizedBox(height: 16),
          CustomTextFormFeild(
            controller: usernameController,
            hintText: 'إسم المستخدم',
            keyboardType: TextInputType.emailAddress,
            suffixIcon: Icon(
              Icons.person,
              color: AppColors.textPrimaryColor,
              size: 26,
            ),
          ),
          const SizedBox(height: 16),
          CustomTextFormFeild(
            controller: emailController,
            hintText: 'البريد الإلكتروني',
            keyboardType: TextInputType.emailAddress,
            suffixIcon: Icon(
              Icons.email,
              color: AppColors.textPrimaryColor,
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
          const SizedBox(height: 16),
          CustomTextFormFeild(
            controller: confirmPasswordController,
            isPassword: true,
            hintText: 'تأكيد كلمة المرور',
            keyboardType: TextInputType.visiblePassword,
            type: 'confirm',
            passwordController: passwordController,
          ),
          const SizedBox(height: 16),
          CustomTextFormFeild(
            controller: phoneController,
            hintText: 'رقم الهاتف',
            keyboardType: TextInputType.phone,
            suffixIcon: Icon(
              Icons.phone,
              color: AppColors.textPrimaryColor,
              size: 26,
            ),
          ),
          const SizedBox(height: 17),
          CustomButton(title: 'إنشاء حساب', onPressed: signUpMethod),
        ],
      ),
    );
  }

  void signUpMethod() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      autovalidateMode = AutovalidateMode.disabled;
      context.go(CreateStoreView.routeName);
    } else {
      setState(() {
        autovalidateMode = AutovalidateMode.always;
      });
    }
  }
}
