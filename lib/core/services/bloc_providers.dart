import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      ],
      child: child,
    );
  }
}
