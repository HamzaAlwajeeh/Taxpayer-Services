import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tax_payer/Features/Auth/data/models/user/user.dart';
import 'package:tax_payer/Features/Auth/presentation/logic/logout_cubit/logout_cubit.dart';
import 'package:tax_payer/Features/Auth/presentation/logic/logout_cubit/logout_state.dart';
import 'package:tax_payer/core/constants/constants.dart';
import 'package:tax_payer/core/helper/custom_loading_indicator.dart';
import 'package:tax_payer/core/helper/custom_toast_bar.dart';
import 'package:tax_payer/core/routers/route_names.dart';
import 'package:tax_payer/core/services/shared_pref_singleton.dart';
import 'package:tax_payer/core/utils/app_colors.dart';
import 'package:tax_payer/core/widgets/custom_button.dart';
import 'package:tax_payer/core/widgets/sign_out_confirmation_dialog_widget.dart';
import 'package:tax_payer/generated/l10n.dart';

class PofileCustomButton extends StatelessWidget {
  const PofileCustomButton({super.key, required this.user});

  final User? user;

  @override
  Widget build(BuildContext context) {
    final bool isLoggedIn = Prefs.getBool(AppConstants.kIsLogedIn);
    return BlocConsumer<LogoutCubit, LogoutState>(
      listener: (context, state) {
        if (state is LogoutSuccess) {
          Prefs.removeUser(AppConstants.kCurrentUser);
          Prefs.removeBool(AppConstants.kIsLogedIn);
          Prefs.removeString(AppConstants.kToken);
          context.go(RouteNames.login);
        } else if (state is LogoutFailure) {
          customToastBar(
            context: context,
            message: state.errorMessage,
            icon: Icons.error,
            backgroundColor: AppColors.red(),
            textColor: AppColors.white(),
          );
        }
      },
      builder: (BuildContext context, state) {
        if (!isLoggedIn) {
          return CustomButton(
            textColor: AppColors.white(),
            borderColor: AppColors.primaryColor(context),
            backgroundColor: Color(0xffAA1212).withOpacity(0.8),
            title: S.of(context).Login,
            onPressed: () {
              context.go(RouteNames.login);
            },
          );
        }
        return state is LogoutLoading
            ? CustomLoadingIndicator()
            : CustomButton(
              backgroundColor: AppColors.borderColor(context),
              isLogout: true,
              title: S.of(context).Logout,
              onPressed: () {
                showCupertinoModalPopup(
                  context: context,
                  builder:
                      (_) => SignOutConfirmationDialogWidget(
                        onConfirm: () {
                          BlocProvider.of<LogoutCubit>(context).logout();
                        },
                      ),
                );
              },
            );
      },
    );
  }
}
