import 'package:flutter/material.dart';
import 'package:tax_payer/core/helper/get_data_function.dart';
import 'package:tax_payer/core/utils/app_colors.dart';
import 'package:tax_payer/core/utils/app_text_style.dart';
import 'package:tax_payer/generated/l10n.dart';

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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 8, 8),
          child: Text(
            widget.hintText,
            style: TextStyles.semiBold16.copyWith(
              color: AppColors.textRedColor(context),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: AppColors.textFeilColor(context),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.borderColor(context), width: 1),
          ),
          child: Row(
            children: [
              if (widget.prefixIcon != null) ...[
                Padding(
                  padding: const EdgeInsetsDirectional.only(start: 8, end: 4),
                  child: widget.prefixIcon,
                ),
              ],
              Expanded(
                child: TextFormField(
                  onTap: () {
                    if (widget.isCalender == true) {
                      getDate(context).then((value) {
                        widget.controller?.text = value;
                      });
                      setState(() {});
                    }
                  },
                  cursorColor: AppColors.primaryColor(context),
                  readOnly: widget.readOnly ?? false,
                  controller: widget.controller,
                  initialValue: widget.initialValue,
                  onSaved: widget.onSaved,
                  onChanged: widget.onChanged,

                  validator: (value) {
                    final text = value?.trim() ?? '';

                    if (widget.type == 'confirm') {
                      final password =
                          widget.passwordController?.text.trim() ?? '';

                      if (password.isNotEmpty && text.isEmpty) {
                        return S.of(context).FieldIsRequired;
                      }

                      if (password.isNotEmpty && text != password) {
                        return S.of(context).PasswordNotMatch;
                      }

                      return null;
                    }

                    if (widget.isPassword == true) {
                      if (text.isEmpty) return null;
                      if (text.length < 8)
                        return S.of(context).PasswordMinLength;
                      return null;
                    }

                    if (text.isEmpty) {
                      return S.of(context).FieldIsRequired;
                    }

                    return null;
                  },

                  obscureText: widget.isPassword == true ? !isVisible : false,

                  style: TextStyles.bold16.copyWith(
                    color: AppColors.textPrimaryColor(context),
                  ),

                  textInputAction: TextInputAction.next,
                  keyboardType: widget.keyboardType,

                  decoration: InputDecoration(
                    isDense: true,
                    hintText: widget.hintText,
                    hintStyle: TextStyles.bold16.copyWith(
                      color: AppColors.textPrimaryColor(
                        context,
                      ).withOpacity(0.6),
                    ),
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 0,
                    ),
                  ),
                ),
              ),
              if (widget.isPassword == true || widget.suffixIcon != null) ...[
                Padding(
                  padding: const EdgeInsetsDirectional.only(start: 5, end: 8),
                  child:
                      widget.isPassword == true
                          ? IconButton(
                            padding: EdgeInsets.zero,
                            splashRadius: 20,
                            onPressed: () {
                              setState(() {
                                isVisible = !isVisible;
                              });
                            },
                            icon: Icon(
                              isVisible
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              size: 24,
                              color: AppColors.textPrimaryColor(context),
                            ),
                          )
                          : GestureDetector(
                            onTap:
                                widget.isCalender == true
                                    ? () async {
                                      await getDate(context).then((value) {
                                        widget.controller?.text = value;
                                      });
                                      setState(() {});
                                    }
                                    : null,
                            child: widget.suffixIcon,
                          ),
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }

  OutlineInputBorder buildBorder(BuildContext context) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: AppColors.borderColor(context), width: 1),
    );
  }
}
