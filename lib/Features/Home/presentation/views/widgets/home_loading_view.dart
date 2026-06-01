import 'package:flutter/material.dart';
import 'package:tax_payer/core/utils/app_colors.dart';

class HomeLoadingView extends StatelessWidget {
  const HomeLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const AlwaysScrollableScrollPhysics(),
      children: [
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.38),
        Center(
          child: CircularProgressIndicator(
            color: AppColors.primaryColor(context),
          ),
        ),
      ],
    );
  }
}
