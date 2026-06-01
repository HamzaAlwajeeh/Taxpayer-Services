import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tax_payer/Features/DashBoard/data/models/user_file/user_file.dart';
import 'package:tax_payer/Features/Home/presentation/logic/user_file_cubit/user_file_cubit.dart';
import 'package:tax_payer/Features/Home/presentation/logic/user_file_cubit/user_file_state.dart';
import 'package:tax_payer/Features/Home/presentation/views/widgets/home_content.dart';
import 'package:tax_payer/Features/Home/presentation/views/widgets/home_loading_view.dart';
import 'package:tax_payer/Features/Home/presentation/views/widgets/home_message_view.dart';
import 'package:tax_payer/core/constants/constants.dart';
import 'package:tax_payer/core/routers/route_names.dart';
import 'package:tax_payer/core/services/shared_pref_singleton.dart';
import 'package:tax_payer/core/utils/app_colors.dart';
import 'package:tax_payer/generated/l10n.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});
  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  bool isLogged = Prefs.getBool(AppConstants.kIsLogedIn);
  @override
  void initState() {
    super.initState();
    if (isLogged) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        final cubit = context.read<UserFileCubit>();
        if (cubit.state is UserFileInitial) {
          cubit.initializeCurrentFile();
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: RefreshIndicator(
        color: AppColors.primaryColor(context),
        backgroundColor: AppColors.itemsColor(context),
        onRefresh: () async {
          if (isLogged) {
            await context.read<UserFileCubit>().initializeCurrentFile();
          }
        },
        child: BlocBuilder<UserFileCubit, UserFileState>(
          builder: (context, state) {
            if (state is UserFileLoading) {
              return const HomeLoadingView();
            }

            if (state is UserFileFailure) {
              return HomeMessageView(
                message: state.errorMessage,
                actionLabel: S.of(context).LoadUserFiles,
                onPressed:
                    () => context.read<UserFileCubit>().initializeCurrentFile(),
              );
            }

            final userFile = _readUserFile(context, state);
            if (userFile == null) {
              return HomeMessageView(
                message: S.of(context).NotAvailable,
                actionLabel: S.of(context).Login,
                onPressed: () => context.go(RouteNames.login),
              );
            }

            return isLogged
                ? HomeContent(userFile: userFile)
                : HomeMessageView(
                  message: S.of(context).Login,
                  actionLabel: S.of(context).Login,
                  onPressed: () {
                    context.go(RouteNames.login);
                  },
                );
          },
        ),
      ),
    );
  }

  UserFile? _readUserFile(BuildContext context, UserFileState state) {
    if (state is UserFileSingleSuccess) return state.userFile;

    final cached = context.read<UserFileCubit>().userFile;
    final hasData =
        cached.taxPayer != null ||
        cached.file != null ||
        (cached.taxInformations?.isNotEmpty ?? false);

    return hasData ? cached : null;
  }
}
