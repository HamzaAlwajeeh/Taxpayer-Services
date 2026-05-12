import 'package:flutter/material.dart';
import 'package:tax_payer/Features/Profile/presentation/views/widgets/item_card.dart';
import 'package:tax_payer/Features/Settings/app_settings.dart';
import 'package:tax_payer/core/constants/app_spacing.dart';
import 'package:tax_payer/core/utils/app_images.dart';
import 'package:tax_payer/generated/l10n.dart';

class SettingItems extends StatelessWidget {
  const SettingItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: AppSpacing.s16,
      children: [
        ItemCard(
          title: S.of(context).StoreName,
          subtitle: S.of(context).ActiveStatus,
          icon: Assets.assetsIconsActivity,
          onSwitchChanged: (value) {},
          hasIcon: false,
        ),
        ItemCard(
          title: S.of(context).DarkMode,
          subtitle: S.of(context).Disabled,
          icon: Assets.assetsIconsMoon,
          isSwitch: true,
          switchValue: false,
          onSwitchChanged: (value) {
            AppSettings.changeTheme();
          },
        ),
        ItemCard(
          title: S.of(context).Language,
          subtitle: S.of(context).Arabic,
          icon: Assets.assetsIconsGlobal,
          isSwitch: false,
          onSwitchChanged: (value) {},
          switchValue: true,
          onTap: () {
            AppSettings.changeLanguage();
          },
        ),
        ItemCard(
          title: S.of(context).SecurityAndPrivacy,
          subtitle: S.of(context).ClickToViewDetails,
          icon: Assets.assetsIconsPrivacy,
          isSwitch: false,
          onSwitchChanged: (value) {},
          switchValue: true,
        ),
      ],
    );
  }
}
