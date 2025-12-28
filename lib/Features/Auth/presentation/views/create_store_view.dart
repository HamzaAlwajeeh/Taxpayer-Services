import 'package:flutter/material.dart';
import 'package:marchant_app/Features/Auth/presentation/views/widgets/create_store_view_body.dart';
import 'package:marchant_app/core/widgets/gradient_background.dart';

class CreateStoreView extends StatelessWidget {
  const CreateStoreView({super.key});
  static const String routeName = '/create-store';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        hasImage: true,
        child: const CreateStoreViewBody(),
      ),
    );
  }
}
