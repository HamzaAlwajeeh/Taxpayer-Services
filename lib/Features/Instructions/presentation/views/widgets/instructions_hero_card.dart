import 'package:flutter/material.dart';
import 'package:tax_payer/core/constants/app_spacing.dart';
import 'package:tax_payer/core/utils/app_text_style.dart';

class InstructionsHeroCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final Color color;

  const InstructionsHeroCard({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.s24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [color, color.withOpacity(0.85)],
        ),
        borderRadius: BorderRadius.circular(AppSpacing.radius16),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.35),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(AppSpacing.s16),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(AppSpacing.radius16),
            ),
            child: Icon(icon, color: Colors.white, size: 40),
          ),
          const SizedBox(height: AppSpacing.s16),
          Text(
            title,
            style: TextStyles.bold22.copyWith(color: Colors.white),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppSpacing.s8),
          Text(
            description,
            style: TextStyles.regular14.copyWith(
              color: Colors.white.withOpacity(0.9),
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
