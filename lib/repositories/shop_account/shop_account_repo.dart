
import 'package:dio/dio.dart';

abstract class ShopAccountRepository {
  Future<Response> registerShopAccount();
}
