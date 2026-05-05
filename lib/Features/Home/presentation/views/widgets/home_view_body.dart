import 'package:flutter/material.dart';
import 'package:tax_payer/Features/Settings/app_settings.dart';
import 'package:tax_payer/core/helper/custom_toast_bar.dart';
import 'package:tax_payer/core/services/notification_service.dart';
import 'package:tax_payer/core/widgets/custom_button.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 320),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 16,
            children: [
              CustomButton(
                title: 'إرسال الإشعار',
                onPressed: NotificationService.showTaxDeclarationReminder,
              ),
              CustomButton(
                title: 'تغيير الثيم',
                onPressed: () {
                  AppSettings.changeTheme();
                  customToastBar(
                    context: context,
                    message: 'تم تغيير الثيم',
                    backgroundColor: Colors.white,
                    icon: Icons.check,
                    textColor: Colors.green,
                  );
                },
              ),
              CustomButton(
                title: 'تغيير اللغة',
                onPressed: () {
                  AppSettings.changeLanguage();
                  customToastBar(
                    context: context,
                    message: 'تم تغيير اللغة',
                    backgroundColor: Colors.white,
                    icon: Icons.check,
                    textColor: Colors.green,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
