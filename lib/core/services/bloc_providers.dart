import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tax_payer/Features/Auth/data/repos/auth_repo.dart';
import 'package:tax_payer/Features/Auth/presentation/logic/forgot_password_cubit/forgot_password_cubit.dart';
import 'package:tax_payer/Features/Auth/presentation/logic/login_cubit/login_cubit.dart';
import 'package:tax_payer/Features/Auth/presentation/logic/logout_cubit/logout_cubit.dart';
import 'package:tax_payer/Features/Auth/presentation/logic/register_cubit/register_cubit.dart';
import 'package:tax_payer/Features/Auth/presentation/logic/reset_password_cubit/reset_password_cubit.dart';
import 'package:tax_payer/Features/Auth/presentation/logic/verify_code_cubit/verify_code_cubit.dart';
import 'package:tax_payer/core/services/service_locator.dart';

class BlocProviders {
  const BlocProviders._();

  static Widget wrapWithProviders({required Widget child}) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginCubit(getIt<AuthRepo>())),
        BlocProvider(create: (context) => RegisterCubit(getIt<AuthRepo>())),
        BlocProvider(create: (context) => LogoutCubit(getIt<AuthRepo>())),
        BlocProvider(
          create: (context) => ForgotPasswordCubit(getIt<AuthRepo>()),
        ),
        BlocProvider(create: (context) => VerifyCodeCubit(getIt<AuthRepo>())),
        BlocProvider(
          create: (context) => ResetPasswordCubit(getIt<AuthRepo>()),
        ),
      ],
      child: child,
    );
  }
}
