import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tax_payer/Features/Auth/presentation/logic/logout_cubit/logout_cubit.dart';
import 'package:tax_payer/Features/Auth/presentation/logic/logout_cubit/logout_state.dart';
import 'package:tax_payer/core/constants/constants.dart';
import 'package:tax_payer/core/helper/custom_loading_indicator.dart';
import 'package:tax_payer/core/helper/custom_toast_bar.dart';
import 'package:tax_payer/core/routers/route_names.dart';
import 'package:tax_payer/core/services/shared_pref_singleton.dart';
import 'package:tax_payer/core/utils/app_colors.dart';
import 'package:tax_payer/core/widgets/custom_button.dart';
import 'package:tax_payer/generated/l10n.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Center(
        child: BlocConsumer<LogoutCubit, LogoutState>(
          listener: (context, state) {
            if (state is LogoutSuccess) {
              customToastBar(
                context: context,
                message: S.of(context).LogoutSuccess,
                backgroundColor: AppColors.customGreen(),
                icon: Icons.check,
                textColor: AppColors.white(),
              );
              Prefs.setBool(AppConstants.kIsLogedIn, false);
              context.go(RouteNames.login);
            }
          },
          builder:
              (BuildContext context, state) =>
                  state is LogoutLoading
                      ? CustomLoadingIndicator()
                      : CustomButton(
                        title: S.of(context).Logout,
                        onPressed: () {
                          BlocProvider.of<LogoutCubit>(context).logout();
                        },
                      ),
        ),
      ),
    );
  }
}
