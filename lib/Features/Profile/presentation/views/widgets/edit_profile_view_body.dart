import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tax_payer/Features/Auth/data/models/user/user.dart';
import 'package:tax_payer/Features/Profile/presentation/logic/edit_profile_cubit/edit_profile_cubit.dart';
import 'package:tax_payer/Features/Profile/presentation/logic/edit_profile_cubit/edit_profile_state.dart';
import 'package:tax_payer/Features/Profile/presentation/logic/user_profile_cubit/user_profile_cubit.dart';
import 'package:tax_payer/Features/Profile/presentation/views/widgets/edit_profile_form.dart';
import 'package:tax_payer/Features/Profile/presentation/views/widgets/edit_profile_image.dart';
import 'package:tax_payer/core/constants/app_spacing.dart';
import 'package:tax_payer/core/constants/constants.dart';
import 'package:tax_payer/core/helper/custom_loading_indicator.dart';
import 'package:tax_payer/core/helper/custom_toast_bar.dart';
import 'package:tax_payer/core/services/shared_pref_singleton.dart';
import 'package:tax_payer/core/utils/app_colors.dart';
import 'package:tax_payer/core/widgets/custom_app_bar.dart';
import 'package:tax_payer/core/widgets/custom_button.dart';
import 'package:tax_payer/generated/l10n.dart';

class EditProfileViewBody extends StatefulWidget {
  const EditProfileViewBody({super.key});

  @override
  State<EditProfileViewBody> createState() => _EditProfileViewBodyState();
}

class _EditProfileViewBodyState extends State<EditProfileViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController _firstNameController;
  late TextEditingController _userNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _phoneController;
  late TextEditingController _passwordController;
  late TextEditingController _confirmPasswordController;
  File? _selectedImage;

  @override
  void initState() {
    super.initState();
    User? user = Prefs.getUser(AppConstants.kCurrentUser);
    _firstNameController = TextEditingController(text: user?.firstName ?? '');
    _lastNameController = TextEditingController(text: user?.lastName ?? '');
    _phoneController = TextEditingController(text: user?.phone ?? '');
    _userNameController = TextEditingController(text: user?.userName ?? '');
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EditProfileCubit, EditProfileState>(
      listener: (context, state) {
        if (state is EditProfileSuccess) {
          context.read<UserProfileCubit>().getUserProfile();
          customToastBar(
            context: context,
            message: state.message,
            icon: Icons.check_circle,
            backgroundColor: AppColors.primaryColor(context),
            textColor: Colors.white,
          );
          context.pop();
        } else if (state is EditProfileFailure) {
          customToastBar(
            context: context,
            message: state.message,
            icon: Icons.error,
            backgroundColor: AppColors.red(),
            textColor: Colors.white,
          );
        }
      },
      builder: (context, state) {
        return Stack(
          children: [
            Scaffold(
              backgroundColor: const Color(0xffF9F9F9),
              appBar: CustomAppBar(title: S.of(context).EditProfile),
              body: SafeArea(
                child: AbsorbPointer(
                  absorbing: state is EditProfileLoading,
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 30,
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          EditProfileImage(
                            currentImage:
                                Prefs.getUser(AppConstants.kCurrentUser)?.image,
                            onImageChanged: (image) {
                              setState(() {
                                _selectedImage = image;
                              });
                            },
                          ),
                          const SizedBox(height: AppSpacing.s32),
                          EditProfileForm(
                            firstNameController: _firstNameController,
                            lastNameController: _lastNameController,
                            phoneController: _phoneController,
                            passwordController: _passwordController,
                            confirmPasswordController:
                                _confirmPasswordController,
                          ),
                          const SizedBox(height: AppSpacing.s40),
                          state is EditProfileLoading
                              ? CustomLoadingIndicator()
                              : CustomButton(
                                title: S.of(context).EditProfile,
                                onPressed: () {
                                  FocusScope.of(context).unfocus();
                                  if (_formKey.currentState!.validate()) {
                                    User? user = Prefs.getUser(
                                      AppConstants.kCurrentUser,
                                    );
                                    context
                                        .read<EditProfileCubit>()
                                        .editProfile(
                                          idCard: null,
                                          userName:
                                              _userNameController.text ==
                                                      user?.userName
                                                  ? null
                                                  : _userNameController.text,
                                          firstName:
                                              _firstNameController.text ==
                                                      user?.firstName
                                                  ? null
                                                  : _firstNameController.text,
                                          lastName:
                                              _lastNameController.text ==
                                                      user?.lastName
                                                  ? null
                                                  : _lastNameController.text,
                                          phone:
                                              _phoneController.text ==
                                                      user?.phone
                                                  ? null
                                                  : _phoneController.text,
                                          image: _selectedImage,
                                          password:
                                              _passwordController.text.isEmpty
                                                  ? null
                                                  : _passwordController.text,
                                          confirmPassword:
                                              _confirmPasswordController
                                                      .text
                                                      .isEmpty
                                                  ? null
                                                  : _confirmPasswordController
                                                      .text,
                                        );
                                  }
                                },
                              ),
                          const SizedBox(height: AppSpacing.s20),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
