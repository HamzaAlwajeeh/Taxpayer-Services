import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tax_payer/Features/Auth/presentation/logic/logout_cubit/logout_cubit.dart';
import 'package:tax_payer/Features/Auth/presentation/logic/logout_cubit/logout_state.dart';
import 'package:tax_payer/core/constants/constants.dart';
import 'package:tax_payer/core/helper/custom_loading_indicator.dart';
import 'package:tax_payer/core/services/shared_pref_singleton.dart';
import 'package:tax_payer/core/widgets/custom_button.dart';
import 'package:tax_payer/generated/l10n.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<LogoutCubit, LogoutState>(
        builder:
            (BuildContext context, state) =>
                state is LogoutLoading
                    ? CustomLoadingIndicator()
                    : CustomButton(
                      title: S.of(context).Logout,
                      onPressed: () {
                        BlocProvider.of<LogoutCubit>(context).logout();
                        Prefs.setBool(AppConstants.kIsLogedIn, false);
                      },
                    ),
      ),
    );
  }
}
