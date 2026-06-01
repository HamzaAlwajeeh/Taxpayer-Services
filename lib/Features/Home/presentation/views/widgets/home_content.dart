import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:tax_payer/Features/DashBoard/data/models/user_file/user_file.dart';
import 'package:tax_payer/Features/Home/presentation/views/widgets/business_activity_section.dart';
import 'package:tax_payer/Features/Home/presentation/views/widgets/home_banner.dart';
import 'package:tax_payer/Features/Home/presentation/views/widgets/recent_payments_section.dart';
import 'package:tax_payer/Features/Home/presentation/views/widgets/user_file_header.dart';
import 'package:tax_payer/core/constants/app_spacing.dart';
import 'package:tax_payer/core/utils/app_colors.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({
    super.key,
    required this.userFile,
    this.isLoading = false,
  });

  final UserFile userFile;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final contentUserFile = isLoading ? _skeletonUserFile : userFile;

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
          _SkeletonizedSection(
            isLoading: isLoading,
            child: BusinessActivitySection(userFile: contentUserFile),
          ),
          const SizedBox(height: AppSpacing.s24),
          _SkeletonizedSection(
            isLoading: isLoading,
            child: RecentPaymentsSection(userFile: contentUserFile),
          ),
        ],
      ),
    );
  }

  static final UserFile _skeletonUserFile = UserFile.fromJson({
    'taxPayer': {'trade_name': 'Sample Business Name'},
    'file': {
      'inventory_number': '123456789',
      'payment_type': 'Annual Payment',
      'file_status': 'Active',
      'activity_start_date': '2026-01-01',
    },
    'tax_informations': [
      {'tax_amount': '120000', 'last_payment': '25000'},
      {'tax_amount': '85000', 'last_payment': '18000'},
      {'tax_amount': '64000', 'last_payment': '12000'},
    ],
  });
}

class _SkeletonizedSection extends StatelessWidget {
  const _SkeletonizedSection({required this.isLoading, required this.child});

  final bool isLoading;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: isLoading,
      effect: ShimmerEffect(
        baseColor: _baseColor(context),
        highlightColor: _highlightColor(context),
      ),
      containersColor: _baseColor(context),
      child: child,
    );
  }

  Color _baseColor(BuildContext context) {
    return AppColors.borderColor(context);
  }

  Color _highlightColor(BuildContext context) {
    if (!AppColors.isDarkMode(context)) {
      return AppColors.scaffoldBackgroundColor(false, context);
    }

    return Color.alphaBlend(
      AppColors.white().withValues(alpha: 0.08),
      AppColors.borderColor(context),
    );
  }
}
