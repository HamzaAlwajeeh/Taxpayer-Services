import 'package:flutter/material.dart';
import 'package:tax_payer/Features/Home/data/models/files/file.dart';
import 'package:tax_payer/Features/Home/presentation/views/widgets/user_file_card.dart';
import 'package:tax_payer/core/constants/app_spacing.dart';

class UserFilesList extends StatelessWidget {
  const UserFilesList({super.key, required this.files});

  final List<File> files;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: files.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: index == files.length - 1 ? 0 : AppSpacing.s16,
          ),
          child: UserFileCard(file: files[index]),
        );
      },
    );
  }
}
