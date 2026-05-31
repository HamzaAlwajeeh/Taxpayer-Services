import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tax_payer/Features/DashBoard/data/models/user_file/user_file.dart';
import 'package:tax_payer/Features/Home/presentation/logic/user_file_cubit/user_file_cubit.dart';
import 'package:tax_payer/Features/Home/presentation/logic/user_file_cubit/user_file_state.dart';
import 'package:tax_payer/Features/Home/presentation/views/widgets/business_activity_section.dart';
import 'package:tax_payer/Features/Home/presentation/views/widgets/home_banner.dart';
import 'package:tax_payer/Features/Home/presentation/views/widgets/recent_payments_section.dart';
import 'package:tax_payer/Features/Home/presentation/views/widgets/user_file_header.dart';
import 'package:tax_payer/core/constants/app_spacing.dart';
import 'package:tax_payer/core/constants/constants.dart';
import 'package:tax_payer/core/routers/route_names.dart';
import 'package:tax_payer/core/services/shared_pref_singleton.dart';
import 'package:tax_payer/core/utils/app_colors.dart';
import 'package:tax_payer/core/utils/app_text_style.dart';
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
              return const _HomeLoadingView();
            }

            if (state is UserFileFailure) {
              return _HomeMessageView(
                message: state.errorMessage,
                actionLabel: S.of(context).LoadUserFiles,
                onPressed:
                    () => context.read<UserFileCubit>().initializeCurrentFile(),
              );
            }

            final userFile = _readUserFile(context, state);
            if (userFile == null) {
              return _HomeMessageView(
                message: S.of(context).NotAvailable,
                actionLabel: S.of(context).Login,
                onPressed: () => context.go(RouteNames.login),
              );
            }

            return isLogged
                ? _HomeContent(userFile: userFile)
                : _HomeMessageView(
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

class _HomeContent extends StatelessWidget {
  const _HomeContent({required this.userFile});

  final UserFile userFile;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(
        parent: BouncingScrollPhysics(),
      ),
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.s16,
        AppSpacing.s20,
        AppSpacing.s16,
        AppSpacing.s28,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const UserFileHeader(),
          const SizedBox(height: AppSpacing.s28),
          const HomeBanner(),
          const SizedBox(height: AppSpacing.s24),
          BusinessActivitySection(userFile: userFile),
          const SizedBox(height: AppSpacing.s24),
          RecentPaymentsSection(userFile: userFile),
        ],
      ),
    );
  }
}

class _HomeLoadingView extends StatelessWidget {
  const _HomeLoadingView();

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const AlwaysScrollableScrollPhysics(),
      children: [
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.38),
        Center(
          child: CircularProgressIndicator(
            color: AppColors.primaryColor(context),
          ),
        ),
      ],
    );
  }
}

class _HomeMessageView extends StatelessWidget {
  const _HomeMessageView({
    required this.message,
    required this.actionLabel,
    required this.onPressed,
  });

  final String message;
  final String actionLabel;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.all(AppSpacing.s24),
      children: [
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.28),
        Text(
          message,
          textAlign: TextAlign.center,
          style: TextStyles.semiBold16.copyWith(
            color: AppColors.textPrimaryColor(context),
          ),
        ),
        const SizedBox(height: AppSpacing.s16),
        Center(
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryColor(context),
              foregroundColor: AppColors.white(),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSpacing.radius12),
              ),
            ),
            child: Text(actionLabel),
          ),
        ),
      ],
    );
  }
}
