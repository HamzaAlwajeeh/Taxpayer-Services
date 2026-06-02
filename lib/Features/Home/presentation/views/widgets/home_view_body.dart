import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tax_payer/Features/DashBoard/data/models/user_file/user_file.dart';
import 'package:tax_payer/Features/Home/presentation/logic/user_file_cubit/user_file_cubit.dart';
import 'package:tax_payer/Features/Home/presentation/logic/user_file_cubit/user_file_state.dart';
import 'package:tax_payer/Features/Home/presentation/views/widgets/home_content.dart';
import 'package:tax_payer/Features/Home/presentation/views/widgets/must_login_card.dart';
import 'package:tax_payer/core/constants/constants.dart';
import 'package:tax_payer/core/routers/route_names.dart';
import 'package:tax_payer/core/services/notification_service.dart';
import 'package:tax_payer/core/services/shared_pref_singleton.dart';
import 'package:tax_payer/core/utils/app_colors.dart';
import 'package:tax_payer/core/utils/app_images.dart';
import 'package:tax_payer/generated/l10n.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  final bool _isLoggedIn = Prefs.getBool(AppConstants.kIsLogedIn);

  Future<void> _handleNotifications() async {
    try {
      final alreadyScheduled = Prefs.getBool(
        AppConstants.kNotificationsScheduled,
      );

      if (alreadyScheduled) return;

      await NotificationService.scheduleTaxRemindersJanToApr();

      Prefs.setBool(AppConstants.kNotificationsScheduled, true);
    } catch (e) {
      debugPrint("Notification scheduling error: $e");
    }
  }

  @override
  void initState() {
    super.initState();

    if (!_isLoggedIn) return;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final cubit = context.read<UserFileCubit>();

      if (cubit.state is UserFileInitial) {
        cubit.initializeCurrentFile();
      }

      _handleNotifications();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: RefreshIndicator(
        color: AppColors.primaryColor(context),
        backgroundColor: AppColors.itemsColor(context),
        onRefresh: () async {
          if (_isLoggedIn) {
            await context.read<UserFileCubit>().initializeCurrentFile();
          }
        },
        child: BlocBuilder<UserFileCubit, UserFileState>(
          builder: (context, state) {
            final cubit = context.read<UserFileCubit>();

            if (state is UserFileLoading) {
              return HomeContent(userFile: cubit.userFile, isLoading: true);
            }

            if (state is UserFileFailure) {
              return MustLoginCard(
                icon: Assets.assetsIconsUser,
                message: S.of(context).MustMakeRequestTitle,
                subTitle: S.of(context).MustMakeRequestSubtitle,
                actionLabel: S.of(context).LoadUserFiles,
                onPressed: cubit.initializeCurrentFile,
              );
            }
            final userFile = _readUserFile(cubit, state);
            if (userFile == null) {
              return MustLoginCard(
                icon: Assets.assetsIconsUser,
                message: S.of(context).NotAvailable,
                actionLabel: S.of(context).Login,
                onPressed: () => context.go(RouteNames.login),
              );
            }

            return HomeContent(userFile: userFile);
          },
        ),
      ),
    );
  }

  UserFile? _readUserFile(UserFileCubit cubit, UserFileState state) {
    if (state is UserFileSingleSuccess) return state.userFile;

    final cached = cubit.userFile;
    final hasData =
        cached.taxPayer != null ||
        cached.file != null ||
        (cached.taxInformations?.isNotEmpty ?? false);

    return hasData ? cached : null;
  }
}
