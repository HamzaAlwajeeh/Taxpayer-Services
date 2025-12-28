import 'package:flutter/material.dart';
import 'package:marchant_app/Features/Home/presentation/views/widgets/home_view_body.dart';
import 'package:marchant_app/core/widgets/gradient_background.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const String routeName = '/home-view';
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: GradientBackground(child: const HomeViewBody()));
  }
}
