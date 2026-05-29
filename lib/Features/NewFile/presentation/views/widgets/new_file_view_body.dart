import 'package:flutter/material.dart';
import 'package:tax_payer/Features/NewFile/presentation/views/widgets/new_file_form.dart';
import 'package:tax_payer/core/constants/app_spacing.dart';
import 'package:tax_payer/core/widgets/header_card.dart';
import 'package:tax_payer/generated/l10n.dart';

class NewFileViewBody extends StatelessWidget {
  const NewFileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.s16),
          child: Column(
            children: [
              HeaderCard(
                title: S.of(context).NewFileHeroTitle,
                subTitle: S.of(context).NewFileHeroDetails,
              ),
              const SizedBox(height: AppSpacing.s24),
              NewFileForm(),
            ],
          ),
        ),
      ),
    );
  }
}
