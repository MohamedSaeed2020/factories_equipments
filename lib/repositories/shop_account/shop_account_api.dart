import 'package:dio/dio.dart';
import 'package:factories_equipments/models/shop_account_model.dart';
import 'package:factories_equipments/network/end_points.dart';
import 'package:factories_equipments/network/remote/dio_helper.dart';
import 'package:factories_equipments/repositories/shop_account/shop_account_repo.dart';

class ShopAccountAPI extends ShopAccountRepository {
  var shopAccountModel = ShopAccountModel();

  @override
  @override
  Future<Response> registerShopAccount() async {
    return DioHelper.postData(
      url: registerShopAccountAPI,
      data: shopAccountModel.toJson(),
    );
  }
}
