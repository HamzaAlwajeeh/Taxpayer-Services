import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tax_payer/Features/Home/presentation/views/widgets/must_login_card.dart';
import 'package:tax_payer/Features/NewFile/data/repos/new_file_repo.dart';
import 'package:tax_payer/Features/NewFile/presentation/logic/new_file_cubit/new_file_cubit.dart';
import 'package:tax_payer/Features/NewFile/presentation/views/widgets/new_file_view_body.dart';
import 'package:tax_payer/core/constants/constants.dart';
import 'package:tax_payer/core/routers/route_names.dart';
import 'package:tax_payer/core/services/service_locator.dart';
import 'package:tax_payer/core/services/shared_pref_singleton.dart';
import 'package:tax_payer/core/utils/app_images.dart';
import 'package:tax_payer/generated/l10n.dart';

class NewFileView extends StatelessWidget {
  const NewFileView({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isLoggedIn = Prefs.getBool(AppConstants.kIsLogedIn);
    return BlocProvider(
      create: (context) => NewFileCubit(getIt<NewFileRepo>()),
      child: Scaffold(
        body:
            isLoggedIn
                ? NewFileViewBody()
                : MustLoginCard(
                  icon: Assets.assetsIconsUser,
                  message: S.of(context).MustLoginTitle,
                  subTitle: S.of(context).MustLoginSubtitle,
                  actionLabel: S.of(context).Login,
                  onPressed: () {
                    context.go(RouteNames.login);
                  },
                ),
      ),
    );
  }
}
