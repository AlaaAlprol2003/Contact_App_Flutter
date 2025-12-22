// ignore_for_file: must_be_immutable, use_build_context_synchronously, library_prefixes

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import 'package:image_picker/image_picker.dart' as imagePicker;
import 'package:lottie/lottie.dart';
import 'package:space_app_assignment/core/resources/assets_manager.dart';
import 'package:space_app_assignment/core/resources/colors_manager.dart';
import 'package:space_app_assignment/features/home_screen/contact_view/custom_text_form_field.dart';
import 'package:space_app_assignment/models/user_info_model/information_model.dart';

class UserInformation extends StatefulWidget {
  const UserInformation({super.key});

  @override
  State<UserInformation> createState() => _UserInformationState();
}

class _UserInformationState extends State<UserInformation> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;

  File? selectedImage;
  final photo = imagePicker.ImagePicker();

  chooseImage() async {
    XFile? image = await photo.pickImage(source: ImageSource.gallery);
    if (image != null) {
      selectedImage = File(image.path);
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    emailController = TextEditingController();
    phoneController = TextEditingController();

    nameController.addListener(() {
      setState(() {});
    });
    emailController.addListener(() {
      setState(() {});
    });
    phoneController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
     margin: REdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
         color: ColorsManager.darkBlue,
        borderRadius: BorderRadius.only(

          topLeft: Radius.circular(16),
          topRight: Radius.circular(16)
        )
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              left: 12.w,
              right: 12.w,
              top: 16.h,
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: 150.w,
                        height: 150.h,

                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(color: ColorsManager.gold),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: selectedImage == null
                            ? GestureDetector(
                                onTap: chooseImage,
                                child: Lottie.asset(AnimatedAssets.imagePicker),
                              )
                            : ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: Image.file(
                                  selectedImage!,
                                  fit: BoxFit.fill,
                                ),
                              ),
                      ),
                      SizedBox(width: 20.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              nameController.text.isEmpty
                                  ? "Name"
                                  : nameController.text,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: ColorsManager.gold,
                              ),
                            ),
                            Divider(color: ColorsManager.gold, endIndent: 10),
                            Text(
                              emailController.text.isEmpty
                                  ? "Email"
                                  : emailController.text,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: ColorsManager.gold,
                              ),
                            ),
                            Divider(color: ColorsManager.gold, endIndent: 10),
                            Text(
                              phoneController.text.isEmpty
                                  ? "Phone"
                                  : phoneController.text,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: ColorsManager.gold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  CustomTextFormField(
                    controller: nameController,

                    validator: validateName,
                    hintText: "Enter User Name",
                    keyboardType: TextInputType.text,
                  ),

                  SizedBox(height: 10.h),

                  CustomTextFormField(
                    controller: emailController,
                    validator: validateEmail,
                    hintText: "Enter User Email",
                    keyboardType: TextInputType.emailAddress,
                  ),

                  SizedBox(height: 10.h),

                  CustomTextFormField(
                    controller: phoneController,
                    validator: validatePhone,
                    hintText: "Enter User Phone",
                    keyboardType: TextInputType.phone,
                  ),

                  SizedBox(height: 16.h),
                  SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding:  REdgeInsets.only(bottom: 10),
                      child: FilledButton(
                        onPressed: onEnterUserButtonClicked,
                        style: FilledButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 18.h),
                          backgroundColor: ColorsManager.gold,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(16),
                            side: BorderSide(width: 1),
                          ),
                          
                        ),
                        child: Text(
                          "Enter User",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: ColorsManager.darkBlue,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  String? validateName(String? name) {
    if (name == null || name.trim().isEmpty) {
      return "This field is required";
    }
    if (name.length < 6) {
      return "Name should ba at least 6 chars";
    }

    return null;
  }

  String? validateEmail(String? email) {
    if (email == null || email.trim().isEmpty) {
      return "This field is required";
    }
    if (!RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    ).hasMatch(email)) {
      return "Invalid email";
    }
    return null;
  }

  String? validatePhone(String? phone) {
    if (phone == null || phone.trim().isEmpty) {
      return "This field is required";
    }
    if (!RegExp(r'^(01)[0-9]{9}$').hasMatch(phone)) {
      return "Invalid phone number";
    }
    return null;
  }

  void onEnterUserButtonClicked() {
    if (formKey.currentState?.validate() == false) return;

    UserModel.users.add(
      UserModel(
        userName: nameController.text,
        userEmail: emailController.text,
        userPhone: phoneController.text,
        userImage: selectedImage,
      ),
    );

    Navigator.pop(context);
  }
}
