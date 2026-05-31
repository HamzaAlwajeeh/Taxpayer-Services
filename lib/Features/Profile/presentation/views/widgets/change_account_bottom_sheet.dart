import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tax_payer/Features/DashBoard/presentation/logic/user_file_cubit/user_file_cubit.dart';
import 'package:tax_payer/Features/DashBoard/presentation/logic/user_file_cubit/user_file_state.dart';
import 'package:tax_payer/Features/Profile/presentation/views/widgets/file_item_widget.dart';
import 'package:tax_payer/core/constants/constants.dart';
import 'package:tax_payer/core/services/shared_pref_singleton.dart';
import 'package:tax_payer/generated/l10n.dart';

class ChangeAccountBottomSheet extends StatelessWidget {
  const ChangeAccountBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);
    final cubit = context.read<UserFileCubit>();
    final currentId = Prefs.getInt(AppConstants.kCurrentFile);

    return CupertinoActionSheet(
      title: Text(l10n.ChangeFile),
      message: Text(l10n.SelectFileMessage),

      actions: [
        BlocBuilder<UserFileCubit, UserFileState>(
          builder: (context, state) {
            final files = cubit.filesList;

            return SizedBox(
              height: 300,
              child: ListView.builder(
                itemCount: files.length,
                itemBuilder: (context, index) {
                  final file = files[index];

                  return FileItemWidget(
                    file: file,
                    isSelected: file.id == currentId,
                    onTap: () async {
                      Navigator.pop(context);

                      final id = file.id ?? 0;
                      if (id == 0) return;

                      Prefs.setInt(AppConstants.kCurrentFile, id);

                      await context
                          .read<UserFileCubit>()
                          .initializeCurrentFile();
                    },
                  );
                },
              ),
            );
          },
        ),
      ],

      cancelButton: CupertinoActionSheetAction(
        child: Text(l10n.Cancel),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }
}
