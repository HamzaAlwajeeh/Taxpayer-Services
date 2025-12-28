import 'package:flutter/material.dart';
import 'package:marchant_app/Features/Auth/presentation/views/widgets/sign_up_view_body.dart';
import 'package:marchant_app/core/widgets/background.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});
  static const String routeName = '/sign-up';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(hasImage: true, child: SignUpViewBody()),
    );
  }
}
