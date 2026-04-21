import 'package:flutter/material.dart';
import 'package:tax_payer/core/helper/get_data_function.dart';
import 'package:tax_payer/core/utils/app_colors.dart';
import 'package:tax_payer/core/utils/app_text_style.dart';

class CustomTextFormFeild extends StatefulWidget {
  const CustomTextFormFeild({
    super.key,
    required this.hintText,
    required this.keyboardType,
    this.isPassword,
    this.onChanged,
    this.onSaved,
    this.initialValue,
    this.controller,
    this.suffixIcon,
    this.prefixIcon,
    this.readOnly,
    this.isCalender,
    this.fillColor,
    this.isPerson,
    this.type,
    this.passwordController,
  });
  final String hintText;
  final TextInputType keyboardType;
  final bool? isPassword;
  final void Function(String)? onChanged;
  final void Function(String?)? onSaved;
  final String? initialValue;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool? readOnly;
  final bool? isCalender;
  final bool? isPerson;
  final Color? fillColor;
  final String? type;
  final TextEditingController? passwordController;

  @override
  State<CustomTextFormFeild> createState() => _CustomTextFormFeildState();
}

class _CustomTextFormFeildState extends State<CustomTextFormFeild> {
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: () {
        if (widget.isCalender == true) {
          getDate(context).then((value) {
            widget.controller?.text = value;
          });
          setState(() {});
        }
      },
      readOnly: widget.readOnly ?? false,
      controller: widget.controller,
      initialValue: widget.initialValue,
      onSaved: widget.onSaved,
      onChanged: widget.onChanged,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'هذا الحقل مطلوب';
        }
        if (widget.hintText == 'البريد الإلكتروني' &&
            !RegExp(r'^[\w-\.]+@gmail\.com$').hasMatch(value)) {
          return 'الرجاء إدخال بريد إلكتروني من نوع Gmail';
        }
        if (widget.isPassword == true && value.length < 8) {
          return 'يجب أن تكون كلمة المرور 8 أحرف على الأقل';
        }
        if (widget.type == 'confirm' &&
            value != widget.passwordController?.text) {
          return 'كلمة المرور غير مطابقة';
        }
        return null;
      },
      obscureText: widget.isPassword == true ? !isVisible : false,
      style: TextStyles.bold16.copyWith(color: AppColors.textPrimaryColor),
      textInputAction: TextInputAction.next,
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
        prefixIcon: widget.prefixIcon,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        suffixIcon:
            widget.isPassword ?? false
                ? Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      isVisible = !isVisible;
                      setState(() {});
                    },
                    icon:
                        !isVisible
                            ? Icon(
                              Icons.visibility,
                              color: AppColors.textPrimaryColor,
                              size: 26,
                            )
                            : Icon(
                              Icons.visibility_off,
                              color: AppColors.textPrimaryColor,
                              size: 26,
                            ),
                  ),
                )
                : GestureDetector(
                  onTap:
                      (widget.isCalender == true)
                          ? () async {
                            await getDate(context).then((value) {
                              widget.controller?.text = value;
                            });
                            setState(() {});
                          }
                          : null,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: widget.suffixIcon,
                  ),
                ),
        filled: true,
        hintText: widget.hintText,
        hintStyle: TextStyles.bold16.copyWith(
          color: AppColors.textPrimaryColor,
        ),
        fillColor: AppColors.textFeilColor,
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(),
        errorStyle: TextStyles.semiBold14.copyWith(
          color: AppColors.red.withOpacity(0.8),
        ),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: AppColors.borderColor, width: 1),
    );
  }
}
