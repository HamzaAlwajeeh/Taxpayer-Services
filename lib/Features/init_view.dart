import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tax_payer/Features/Home/presentation/logic/user_file_cubit/user_file_cubit.dart';
import 'package:tax_payer/core/constants/app_spacing.dart';
import 'package:tax_payer/core/constants/constants.dart';
import 'package:tax_payer/core/routers/route_names.dart';
import 'package:tax_payer/core/services/shared_pref_singleton.dart';
import 'package:tax_payer/core/utils/app_colors.dart';
import 'package:tax_payer/core/utils/app_text_style.dart';
import 'package:tax_payer/core/widgets/custom_button.dart';
import 'package:tax_payer/core/widgets/custom_text_form_feild.dart';
import 'package:tax_payer/core/widgets/gradient_background.dart';

class InitView extends StatefulWidget {
  const InitView({super.key});

  @override
  State<InitView> createState() => _InitViewState();
}

class _InitViewState extends State<InitView> {
  final TextEditingController ipController = TextEditingController();

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
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.itemsColor(context),
                borderRadius: BorderRadius.circular(AppSpacing.radius16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  spacing: AppSpacing.s12,
                  children: [
                    Text(
                      'مرحبا بك في تطبيق خدمات المكلفين',
                      style: TextStyles.bold30.copyWith(
                        color: AppColors.textRedColor(context),
                      ),
                    ),
                    CustomTextFormFeild(
                      hintText: "عنوان الاي بي",
                      keyboardType: TextInputType.text,
                      controller: ipController,
                    ),
                    CustomButton(
                      title: "حفظ",
                      onPressed: () {
                        Prefs.setString(
                          AppConstants.kApiBaseUrl,
                          ipController.text.trim(),
                        );
                        navigateToOnBoarding();
                      },
                    ),
                    CustomButton(
                      title: "تجربة الاشعارات",
                      isOutlined: true,
                      onPressed: () {},
                    ),

                    TextButton(
                      onPressed: navigateToOnBoarding,
                      child: Text('تخطي'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
