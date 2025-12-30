import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:marchant_app/Features/Auth/presentation/views/login_view.dart';
import 'package:marchant_app/Features/Auth/presentation/views/widgets/upload_image.dart';
import 'package:marchant_app/core/utils/app_colors.dart';
import 'package:marchant_app/core/widgets/custom_button.dart';
import 'package:marchant_app/core/widgets/custom_text_form_feild.dart';

class StoreForm extends StatefulWidget {
  const StoreForm({super.key});

  @override
  State<StoreForm> createState() => _StoreFormState();
}

class _StoreFormState extends State<StoreForm> {
  TextEditingController storeNameController = TextEditingController();
  TextEditingController storeDiscyptionController = TextEditingController();
  TextEditingController storeLocationController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  void dispose() {
    storeNameController.dispose();
    storeDiscyptionController.dispose();
    storeLocationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 513,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              Form(
                key: formKey,
                autovalidateMode: autovalidateMode,
                child: Column(
                  children: [
                    CustomTextFormFeild(
                      controller: storeNameController,
                      hintText: 'اسم المتجر',
                      keyboardType: TextInputType.text,
                      suffixIcon: Icon(
                        Icons.store,
                        color: AppColors.textPrimaryColor,
                        size: 26,
                      ),
                    ),
                    const SizedBox(height: 16),
                    CustomTextFormFeild(
                      controller: storeDiscyptionController,
                      hintText: 'وصف المتجر',
                      keyboardType: TextInputType.text,
                      suffixIcon: Icon(
                        Icons.description,
                        color: AppColors.textPrimaryColor,
                        size: 26,
                      ),
                    ),
                    const SizedBox(height: 17),
                    CustomTextFormFeild(
                      controller: storeLocationController,
                      hintText: 'موقع المتجر',
                      keyboardType: TextInputType.text,
                      suffixIcon: Icon(
                        Icons.location_on,
                        color: AppColors.textPrimaryColor,
                        size: 26,
                      ),
                    ),
                    const SizedBox(height: 17),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2),
                      child: UploadImage(
                        title: 'صورة ملكية المتجر أو عقد إيجار',
                        subTitle: 'JPEG,JPG,PNG',
                        isStoreImage: false,
                      ),
                    ),
                    const SizedBox(height: 17),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2),
                      child: UploadImage(
                        title: 'صورة للمتجر',
                        subTitle: 'JPEG,JPG,PNG',
                        isStoreImage: true,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 17),
        CustomButton(title: 'إرسال', onPressed: createStoreMethod),
      ],
    );
  }

  void createStoreMethod() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      autovalidateMode = AutovalidateMode.disabled;
      context.go(LoginView.routeName);
    } else {
      setState(() {
        autovalidateMode = AutovalidateMode.always;
      });
    }
  }
}
