import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:space_app_assignment/features/home_screen/contact_view/contact_view.dart';
import 'package:space_app_assignment/core/resources/assets_manager.dart';
import 'package:space_app_assignment/core/resources/colors_manager.dart';
import 'package:space_app_assignment/models/user_info_model/information_model.dart';
import 'package:space_app_assignment/features/home_screen/bottom_sheet_details.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.darkBlue,
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          if (UserModel.users.isNotEmpty)
            FloatingActionButton(
              onPressed: () {
                UserModel.users.removeAt(UserModel.users.length - 1);
                setState(() {});
              },
              backgroundColor: ColorsManager.red,
              foregroundColor: ColorsManager.white,
              child: Icon(Icons.delete),
            ),
          SizedBox(height: 20.h),
          if (UserModel.users.length < 6)
            FloatingActionButton(
              onPressed: () async {
                await showModalBottomSheet(
                  isScrollControlled: true,
                  backgroundColor: ColorsManager.darkBlue,
                  useSafeArea: true,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                  ),
                  context: context,
                  builder: (context) => UserInformation(),
                );
                setState(() {});
              },
              backgroundColor: ColorsManager.gold,
              foregroundColor: ColorsManager.darkBlue,

              child: Icon(Icons.add, size: 30),
            ),
        ],
      ),

      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: REdgeInsets.symmetric(horizontal: 26, vertical: 24),
              child: Image.asset(ImageAssets.homeLogo),
            ),

            UserModel.users.isEmpty
                ? Expanded(
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 80.h,),
                          LottieBuilder.asset("assets/json/empty.json"),
                          Text("There is No Contacts Added Here",style:TextStyle(fontSize: 20,fontWeight: 
                          FontWeight.w500,color: ColorsManager.gold))
                        ],
                      ),
                    ),
                  )
                : Expanded(child: ContactView()),
          ],
        ),
      ),
    );
  }
}
