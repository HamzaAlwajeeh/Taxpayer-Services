import 'package:flutter/material.dart';
import 'package:tax_payer/core/utils/app_colors.dart';

class EditProfileViewBody extends StatelessWidget {
  const EditProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Edit Profile Body',
        style: TextStyle(color: AppColors.textRedColor(context)),
      ),
    );
  }
}
