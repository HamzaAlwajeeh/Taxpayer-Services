import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tax_payer/Features/NewFile/data/repos/new_file_repo.dart';
import 'package:tax_payer/Features/NewFile/presentation/logic/new_file_cubit/new_file_cubit.dart';
import 'package:tax_payer/Features/NewFile/presentation/views/widgets/new_file_view_body.dart';
import 'package:tax_payer/core/services/service_locator.dart';
import 'package:tax_payer/core/utils/app_colors.dart';
import 'package:tax_payer/core/widgets/custom_app_bar.dart';
import 'package:tax_payer/generated/l10n.dart';

class NewFileView extends StatelessWidget {
  const NewFileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewFileCubit(getIt<NewFileRepo>()),
      child: Scaffold(
        appBar: CustomAppBar(
          title: S.of(context).NewFile,
          color: AppColors.primaryColor(context),
        ),
        body: const NewFileViewBody(),
      ),
    );
  }
}
