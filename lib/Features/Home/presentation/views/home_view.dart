import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tax_payer/Features/Home/presentation/views/widgets/home_view_body.dart';
import 'package:tax_payer/Features/Home/presentation/views/widgets/must_login_card.dart';
import 'package:tax_payer/core/constants/constants.dart';
import 'package:tax_payer/core/routers/route_names.dart';
import 'package:tax_payer/core/services/shared_pref_singleton.dart';
import 'package:tax_payer/core/utils/app_images.dart';
import 'package:tax_payer/core/widgets/custom_floating_action_button.dart';
import 'package:tax_payer/generated/l10n.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    final isLoggedIn = Prefs.getBool(AppConstants.kIsLogedIn);
    return Scaffold(
      body:
          isLoggedIn
              ? HomeViewBody()
              : MustLoginCard(
                icon: Assets.assetsIconsUser,
                message: S.of(context).MustLoginTitle,
                subTitle: S.of(context).MustLoginSubtitle,
                actionLabel: S.of(context).Login,
                onPressed: () {
                  context.go(RouteNames.login);
                },
              ),
      floatingActionButton: Visibility(
        visible: isLoggedIn,
        child: CustomFloatingActionButton(onPressed: () {}),
      ),
    );
  }
}
