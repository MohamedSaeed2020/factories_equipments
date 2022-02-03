class ShopAccountModel {
  String? firstName;
  String? phone;
  String? userName;
  String? password;
  String? email;
  String? companyNameInCommercialRegistry;
  String? commercialRegistryNumber;
  String? country;
  String? governorate;
  String? region;
  String? productsCategory;

  ShopAccountModel(
      {this.firstName,
      this.phone,
      this.userName,
      this.password,
      this.email,
      this.companyNameInCommercialRegistry,
      this.commercialRegistryNumber,
      this.country,
      this.governorate,
      this.region,
      this.productsCategory});

  ShopAccountModel.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    phone = json['phone'];
    userName = json['userName'];
    password = json['password'];
    email = json['email'];
    companyNameInCommercialRegistry = json['companyNameInCommercialRegistry'];
    commercialRegistryNumber = json['commercialRegistryNumber'];
    country = json['country'];
    governorate = json['governorate'];
    region = json['region'];
    productsCategory = json['productsCategory'];
  }

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'phone': phone,
      'userName': userName,
      'password': password,
      'email': email,
      'companyNameInCommercialRegistry': companyNameInCommercialRegistry,
      'commercialRegistryNumber': commercialRegistryNumber,
      'country': country,
      'governorate': governorate,
      'region': region,
      'productsCategory': productsCategory,
    };
  }
}
