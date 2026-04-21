import 'package:flutter/material.dart';
import 'package:tax_payer/core/services/notification_service.dart';
import 'package:tax_payer/core/widgets/custom_button.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 320),
          child: CustomButton(
            title: 'إرسال الإشعار',
            onPressed: NotificationService.showTaxDeclarationReminder,
          ),
        ),
      ),
    );
  }
}
