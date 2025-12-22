import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:space_app_assignment/core/resources/colors_manager.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key, required this.hintText,required this.keyboardType, required this.controller,required this.validator
  });
  final String hintText;
  final TextInputType keyboardType;
  final String? Function(String?) validator;

  final TextEditingController controller ;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller:controller ,
      validator:validator ,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType:keyboardType,
      style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: ColorsManager.white),
      cursorColor: ColorsManager.white,
      decoration: InputDecoration(


        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: ColorsManager.gold,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: BorderSide(color: ColorsManager.gold, width: 1.w),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: BorderSide(color: ColorsManager.gold, width: 1.w),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: BorderSide(color: ColorsManager.red, width: 1.w),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: BorderSide(color: ColorsManager.red, width: 1.w),
        ),
      ),
    );
  }
}
