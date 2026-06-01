import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tax_payer/Features/Home/presentation/logic/user_file_cubit/user_file_cubit.dart';
import 'package:tax_payer/core/constants/app_spacing.dart';
import 'package:tax_payer/core/constants/constants.dart';
import 'package:tax_payer/core/routers/route_names.dart';
import 'package:tax_payer/core/services/notification_service.dart';
import 'package:tax_payer/core/services/shared_pref_singleton.dart';
import 'package:tax_payer/core/utils/app_colors.dart';
import 'package:tax_payer/core/utils/app_text_style.dart';
import 'package:tax_payer/core/widgets/custom_button.dart';
import 'package:tax_payer/core/widgets/custom_text_form_feild.dart';
import 'package:tax_payer/core/widgets/gradient_background.dart';
import 'package:tax_payer/core/widgets/logo_widget.dart';

class InitView extends StatefulWidget {
  const InitView({super.key});

  @override
  State<InitView> createState() => _InitViewState();
}

class _InitViewState extends State<InitView> {
  final TextEditingController ipController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  dispose() {
    ipController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void navigateToOnBoarding() async {
      if (!mounted) {
        return;
      }
      if (Prefs.getBool(AppConstants.kSeenOnBoarding) == true) {
        if (Prefs.getBool(AppConstants.kIsLogedIn) == true) {
          await context.read<UserFileCubit>().initializeCurrentFile();
          context.go(RouteNames.dashboard);
        } else {
          context.go(RouteNames.login);
        }
      } else {
        context.go(RouteNames.onBoarding1);
      }
    }

    return Scaffold(
      body: GradientBackground(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Center(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  LogoWidget(),
                  const SizedBox(height: AppSpacing.s24),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.itemsColor(context),
                      borderRadius: BorderRadius.circular(AppSpacing.radius16),
                      border: Border.all(color: AppColors.borderColor(context)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Form(
                        key: formKey,
                        autovalidateMode: autovalidateMode,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          spacing: AppSpacing.s12,
                          children: [
                            Text(
                              textAlign: TextAlign.center,
                              'مرحبا بك في تطبيق خدمات المكلفين',
                              style: TextStyles.bold24.copyWith(
                                color: AppColors.textRedColor(context),
                              ),
                            ),
                            CustomTextFormFeild(
                              hintText: "عنوان الاي بي",
                              keyboardType: TextInputType.text,
                              controller: ipController,
                              prefixIcon: Icon(
                                Icons.wifi_outlined,
                                color: AppColors.textPrimaryColor(context),
                              ),
                            ),
                            CustomButton(
                              title: "حفظ",
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  formKey.currentState!.save();
                                  setState(() {
                                    autovalidateMode =
                                        AutovalidateMode.disabled;
                                  });
                                  Prefs.setString(
                                    AppConstants.kApiBaseUrl,
                                    ipController.text.trim(),
                                  );
                                  navigateToOnBoarding();
                                } else {
                                  setState(() {
                                    autovalidateMode = AutovalidateMode.always;
                                  });
                                }
                              },
                            ),
                            CustomButton(
                              title: "تجربة الاشعارات",
                              isOutlined: true,
                              onPressed: () {
                                NotificationService.showBasicNotification(
                                  id: 1,
                                  title: 'تجربة إشعار',
                                  body: 'هذه رسالة اختبار فورية',
                                );
                              },
                            ),

                            Center(
                              child: TextButton(
                                onPressed: navigateToOnBoarding,
                                child: Text(
                                  'تخطي',
                                  style: TextStyle(
                                    color: AppColors.textPrimaryColor(context),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
