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
    return Padding(
      padding: const EdgeInsets.all(8),
      child: TextField(
        controller: controller,
        onSubmitted: onSubmitted,
        style: TextStyle(fontWeight: FontWeight.bold, height: 1),
        decoration: InputDecoration(
          contentPadding: EdgeInsetsDirectional.symmetric(
            vertical: 18,
            horizontal: 16,
          ),
          suffixIcon: IconButton(
            onPressed: onPressed,
            icon: Icon(Icons.send, color: AppColors.white()),
          ),
          hintText: "اكتب رساله...",
          hintStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black.withOpacity(0.5),
          ),
          border: buildBorder(context),
          enabledBorder: buildBorder(context),
          focusedBorder: buildBorder(context),
        ),
      ),
    );
  }

  OutlineInputBorder buildBorder(BuildContext context) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: BorderSide(color: AppColors.primaryColor(context), width: 2),
    );
  }
}
