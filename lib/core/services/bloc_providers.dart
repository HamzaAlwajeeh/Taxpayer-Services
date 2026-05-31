import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tax_payer/Features/Auth/data/repos/auth_repo.dart';
import 'package:tax_payer/Features/Auth/presentation/logic/reset_password_request_cubit/reset_password_request_cubit.dart';
import 'package:tax_payer/Features/DashBoard/data/repos/user_file_repo.dart';
import 'package:tax_payer/Features/DashBoard/presentation/logic/user_file_cubit/user_file_cubit.dart';
import 'package:tax_payer/Features/Profile/data/repos/profile.repo.dart';
import 'package:tax_payer/Features/Profile/presentation/logic/user_profile_cubit/user_profile_cubit.dart';
import 'package:tax_payer/core/services/service_locator.dart';

class BlocProviders {
  const BlocProviders._();

  static Widget wrapWithProviders({required Widget child}) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UserProfileCubit(getIt<ProfileRepo>()),
        ),
        BlocProvider(
          create: (context) => ResetPasswordRequestCubit(getIt<AuthRepo>()),
        ),
        BlocProvider(create: (context) => UserFileCubit(getIt<UserFileRepo>())),
      ],
      child: child,
    );
  }
}
