import 'package:flutter/material.dart';
import 'package:tax_payer/Features/Auth/presentation/views/widgets/create_store_view_body.dart';
import 'package:tax_payer/core/widgets/gradient_background.dart';

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
