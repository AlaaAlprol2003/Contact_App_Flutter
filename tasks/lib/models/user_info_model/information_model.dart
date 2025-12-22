import 'dart:io';

class UserModel {
  String userName;
  String userEmail;
  String userPhone;
  File?  userImage;

  UserModel({
    required this.userName,
    required this.userEmail,
    required this.userPhone,
    this.userImage
  });


  static List<UserModel> users = [];
  
}
