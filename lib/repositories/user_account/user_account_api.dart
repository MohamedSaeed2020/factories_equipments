import 'package:dio/dio.dart';
import 'package:factories_equipments/models/user_account_model.dart';
import 'package:factories_equipments/network/end_points.dart';
import 'package:factories_equipments/network/remote/dio_helper.dart';
import 'package:factories_equipments/repositories/user_account/user_account_repo.dart';

class UserAccountAPI extends UserAccountRepository {
  var userAccountModel = UserAccountModel();

  @override
  Future<Response> registerUserAccount() {
    return DioHelper.postData(
      url: registerUserAccountAPI,
      data: userAccountModel.toJson(),
    );
  }
}
