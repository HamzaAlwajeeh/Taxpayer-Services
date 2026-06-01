import 'package:flutter/material.dart';
import 'package:tax_payer/Features/DashBoard/data/models/user_file/user_file.dart';
import 'package:tax_payer/Features/Home/presentation/views/widgets/business_activity_section.dart';
import 'package:tax_payer/Features/Home/presentation/views/widgets/home_banner.dart';
import 'package:tax_payer/Features/Home/presentation/views/widgets/recent_payments_section.dart';
import 'package:tax_payer/Features/Home/presentation/views/widgets/user_file_header.dart';
import 'package:tax_payer/core/constants/app_spacing.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key, required this.userFile});

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
