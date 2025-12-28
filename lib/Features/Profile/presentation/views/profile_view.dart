import 'package:flutter/material.dart';
import 'package:marchant_app/Features/Profile/presentation/views/widgets/profile_view_body.dart';
import 'package:marchant_app/core/widgets/gradient_background.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});
  static const String routeName = '/profile-view';
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: GradientBackground(child: const ProfileViewBody()));
  }
}
