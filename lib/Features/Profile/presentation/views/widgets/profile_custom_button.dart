import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tax_payer/Features/Auth/data/models/user/user.dart';
import 'package:tax_payer/Features/Auth/presentation/logic/logout_cubit/logout_cubit.dart';
import 'package:tax_payer/Features/Auth/presentation/logic/logout_cubit/logout_state.dart';
import 'package:tax_payer/core/helper/custom_loading_indicator.dart';
import 'package:tax_payer/core/routers/route_names.dart';
import 'package:tax_payer/core/utils/app_colors.dart';
import 'package:tax_payer/core/widgets/custom_button.dart';
import 'package:tax_payer/core/widgets/sign_out_confirmation_dialog_widget.dart';
import 'package:tax_payer/generated/l10n.dart';

class PofileCustomButton extends StatelessWidget {
  const PofileCustomButton({super.key, required this.user});

  final User? user;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LogoutCubit, LogoutState>(
      builder: (BuildContext context, state) {
        if (user == null) {
          return CustomButton(
            isLogout: true,
            textColor: AppColors.primaryColor(context),
            borderColor: AppColors.primaryColor(context),
            backgroundColor: Color(0xffAA1212).withOpacity(0.2),
            title: S.of(context).Login,
            onPressed: () {
              context.go(RouteNames.login);
            },
          );
        }
        return state is LogoutLoading
            ? CustomLoadingIndicator()
            : CustomButton(
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
