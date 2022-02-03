class UserAccountModel {
  String? phoneNumber;

  UserAccountModel({
    this.phoneNumber,
  });

  UserAccountModel.fromJson(Map<String, dynamic> json) {
    phoneNumber = json['phoneNumber'];
  }

  Map<String, dynamic> toJson() {
    return {
      'phoneNumber': phoneNumber,
    };
  }
}
