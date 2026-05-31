import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:signals_flutter/signals_flutter.dart';
import 'package:tax_payer/Features/Home/presentation/logic/user_file_cubit/user_file_cubit.dart';
import 'package:tax_payer/Features/Profile/presentation/views/widgets/item_card.dart';
import 'package:tax_payer/Features/Profile/presentation/views/widgets/language_bottom_sheet.dart';
import 'package:tax_payer/Features/Settings/app_settings.dart';
import 'package:tax_payer/core/constants/app_spacing.dart';
import 'package:tax_payer/core/constants/constants.dart';
import 'package:tax_payer/core/routers/route_names.dart';
import 'package:tax_payer/core/utils/app_images.dart';
import 'package:tax_payer/generated/l10n.dart';

class SettingItems extends StatelessWidget {
  const SettingItems({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = AppSettings.themeModeSignal.watch(context) == ThemeMode.dark;
    final currentLang = AppSettings.localeSignal.watch(context).languageCode;
    final isArabic = currentLang == AppConstants.kArabicLang;

    return Column(
      spacing: AppSpacing.s16,
      children: [
        ItemCard(
          title:
              BlocProvider.of<UserFileCubit>(
                context,
              ).userFile.taxPayer?.tradeName ??
              'Not Found',
          subtitle:
              BlocProvider.of<UserFileCubit>(
                context,
              ).userFile.file?.fileStatus ??
              'Not Found',
          icon: Assets.assetsIconsActivity,
          onSwitchChanged: (value) {},
          hasIcon: false,
        ),
        ItemCard(
          title: S.of(context).DarkMode,
          subtitle: isDark ? S.of(context).Enabled : S.of(context).Disabled,
          icon: Assets.assetsIconsMoon,
          isSwitch: true,
          switchValue: isDark,
          onSwitchChanged: (value) {
            AppSettings.changeTheme();
          },
        ),
        ItemCard(
          title: S.of(context).Language,
          subtitle: isArabic ? S.of(context).Arabic : S.of(context).English,
          icon: Assets.assetsIconsGlobal,
          isSwitch: false,
          onSwitchChanged: (value) {},
          switchValue: true,
          onTap: () {
            showCupertinoModalPopup(
              context: context,
              builder: (context) => const LanguageBottomSheet(),
            );
          },
        ),
        ItemCard(
          title: S.of(context).SecurityAndPrivacy,
          subtitle: S.of(context).ClickToViewDetails,
          icon: Assets.assetsIconsPrivacy,
          isSwitch: false,
          onTap: () {
            context.push(RouteNames.safetyAndPrivacy);
          },
        ),
      ],
    );
  }
}
