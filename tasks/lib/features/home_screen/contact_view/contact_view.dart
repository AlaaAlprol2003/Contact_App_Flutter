import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:space_app_assignment/core/resources/colors_manager.dart';
import 'package:space_app_assignment/models/user_info_model/information_model.dart';

class ContactView extends StatefulWidget {
  const ContactView({super.key});

  @override
  State<ContactView> createState() => _ContactViewState();
}

class _ContactViewState extends State<ContactView> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 20,
        crossAxisCount: 2,
        childAspectRatio: .6,
      ),
      itemCount: UserModel.users.length,
      itemBuilder: (context, index) {
        return Container(
          width: 188.w,

          margin: REdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: ColorsManager.gold,
            borderRadius: BorderRadius.circular(12.r),
          ),

          child: Column(
            children: [
              Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12.r),
                      topRight: Radius.circular(12.r),
                    ),
                    child: UserModel.users[index].userImage == null
                        ? Image.asset(
                            "assets/images/download.png",
                            fit: BoxFit.fill,
                            height: 200.h,
                            width: double.infinity,
                          )
                        : Image.file(
                            UserModel.users[index].userImage!,
                            height: 200.h,
                            width: double.infinity,
                            fit: BoxFit.fill,
                          ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 10.h,
                      horizontal: 10.w,
                    ),
                    margin: EdgeInsets.symmetric(
                      vertical: 8.h,
                      horizontal: 8.w,
                    ),

                    decoration: BoxDecoration(
                      color: ColorsManager.gold,
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                    child: Text(
                      UserModel.users[index].userName,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: ColorsManager.darkBlue,
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: REdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.email, color: ColorsManager.darkBlue),
                          SizedBox(width: 5.h),
                          Text(
                            UserModel.users[index].userEmail,
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              color: ColorsManager.darkBlue,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15.h),
                      Row(
                        children: [
                          Icon(Icons.phone, color: ColorsManager.darkBlue),
                          SizedBox(width: 5.w),
                          Text(
                            UserModel.users[index].userPhone,
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              color: ColorsManager.darkBlue,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16.h),

                      SizedBox(
                        width: double.infinity,
                        child: FilledButton(
                          onPressed: () {
                            UserModel.users.remove(UserModel.users[index]);
                            setState(() {});
                          },
                          style: FilledButton.styleFrom(
                            backgroundColor: ColorsManager.red,
                            foregroundColor: ColorsManager.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusGeometry.circular(12.r),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.delete),
                              Text(
                                "Delete",
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
