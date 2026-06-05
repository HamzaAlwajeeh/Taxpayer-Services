import 'package:flutter/material.dart';
import 'package:tax_payer/core/utils/app_colors.dart';

class ChatTextField extends StatelessWidget {
  const ChatTextField({
    super.key,
    this.onSubmitted,
    required this.controller,
    this.onPressed,
  });

  final void Function(String)? onSubmitted;
  final TextEditingController controller;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Container(
        margin: const EdgeInsets.fromLTRB(12, 6, 12, 12),
        padding: const EdgeInsetsDirectional.fromSTEB(12, 6, 6, 6),
        decoration: BoxDecoration(
          color: AppColors.itemsColor(context),
          borderRadius: BorderRadius.circular(28),
          border: Border.all(color: AppColors.borderColor(context)),
          boxShadow: [
            BoxShadow(
              color: AppColors.shadowColor(context),
              blurRadius: 22,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: TextField(
                controller: controller,
                onSubmitted: onSubmitted,
                textInputAction: TextInputAction.send,
                minLines: 1,
                maxLines: 4,
                cursorColor: AppColors.primaryColor(context),
                style: TextStyle(
                  color: AppColors.textBoldColor(context),
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                  height: 1.35,
                ),
                decoration: InputDecoration(
                  isDense: true,
                  hintText: 'اكتب رسالة...',
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: AppColors.textSecondaryColor(context),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 13,
                    horizontal: 4,
                  ),
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(width: 8),
            SizedBox(
              width: 46,
              height: 46,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: AppColors.primaryColor(context),
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  onPressed: onPressed,
                  tooltip: 'إرسال',
                  icon: Icon(
                    Icons.send_rounded,
                    color: AppColors.white(),
                    size: 21,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
