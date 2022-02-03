import 'package:dio/dio.dart';

abstract class UserAccountRepository {
  Future<Response> registerUserAccount();
}
