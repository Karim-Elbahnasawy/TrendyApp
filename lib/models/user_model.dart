import 'package:trendy_app/core/utils/app_constants.dart';

class UserModel {
  String name;
  String email;
  String phoneNumber;
  String id;

  UserModel({
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.id,
  });

  UserModel.fromJson(Map<String, dynamic> json)
    : this(
        name: json[AppConstants.name],
        email: json[AppConstants.email],
        phoneNumber: json[AppConstants.phoneNumber],
        id: json[AppConstants.id],
      );

  Map<String, dynamic> toJson() => {
    AppConstants.name: name,
    AppConstants.email: email,
    AppConstants.phoneNumber: phoneNumber,
    AppConstants.id: id,
  };
}
