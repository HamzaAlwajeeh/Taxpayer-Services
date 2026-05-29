import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tax_payer/Features/NewFile/data/repos/new_file_repo.dart';
import 'package:tax_payer/Features/NewFile/presentation/logic/new_file_cubit/new_file_cubit.dart';
import 'package:tax_payer/Features/NewFile/presentation/views/widgets/new_file_view_body.dart';
import 'package:tax_payer/core/services/service_locator.dart';

class NewFileView extends StatelessWidget {
  const NewFileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewFileCubit(getIt<NewFileRepo>()),
      child: Scaffold(body: const NewFileViewBody()),
    );
  }
}
