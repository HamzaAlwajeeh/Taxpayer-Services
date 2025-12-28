import 'package:flutter/material.dart';
import 'package:marchant_app/Features/Analysis/presentation/views/widgets/analysis_view_body.dart';
import 'package:marchant_app/core/widgets/gradient_background.dart';

class AnalysisView extends StatelessWidget {
  const AnalysisView({super.key});
  static const String routeName = '/analysis-view';
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: GradientBackground(child: const AnalysisViewBody()));
  }
}
